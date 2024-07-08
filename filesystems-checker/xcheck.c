#include <assert.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <unistd.h>
#include "xcheck.h"

void panic(char *err_msg)
{
  fprintf(stderr, "%s", err_msg);
  exit(1);
}

// Checks if block address falls within the data block region
int is_data_block(uint block, struct superblock *sb)
{
  return block > sb->bmapstart && block < sb->size;
}

// Returns the number of data blocks in a file
int get_num_blocks(struct dinode *inode)
{
  // Equivalent to ceiling of inode->size / BSIZE
  return (inode->size + BSIZE - 1) / BSIZE;
}

// Given a block address, return its corresponding bit in the bitmap
int read_bitmap(uint block, struct superblock *sb)
{
  int byte = block / 8, bit = block % 8;
  return (bmap_base[byte] >> bit) & 1;
}

// Assumes that block is the address of a block of directory entries. Search
// for parent entry and ensures it equals root. Return 1 if so, panics if not,
// returns 0 if not found.
int check_root(uint block, void *img_ptr)
{
  struct dirent *entry = (struct dirent *)(img_ptr + block * BSIZE);
  while (entry->inum != 0)
  {
    if (!strcmp(entry->name, ".."))
    {
      if (entry->inum != ROOTINO)
        panic("ERROR: root directory does not exist.\n");
      else
        return 1;
    }
    entry++;
  }
  return 0;
}

// Assumes that block is the address of a block of directory entries.
// Checks for . or .. entries and panics if . is not equal to current inum.
// Sets dot and dot_dot flags if they're found.
// Increment use of each entry in inodes_used array.
void check_dir(uint block, int inum, int *dot, int *dot_dot, int *inodes_used, void *img_ptr)
{
  // Search over all valid dir entries while dirs aren't found yet
  struct dirent *entry = (struct dirent *)(img_ptr + block * BSIZE);
  while (entry->inum != 0)
  {
    // Check that . points to current inode
    if (!strcmp(entry->name, "."))
    {
      if (entry->inum != inum)
        panic("ERROR: directory not properly formatted.\n");
      *dot = 1;
    }
    else if (!strcmp(entry->name, ".."))
      *dot_dot = 1;
    inodes_used[entry->inum]++;
    entry++;
  }
}

void check_filesystem(struct superblock *sb, void *img_ptr)
{
  // Initialize expected bitmap based on inode contents
  int bitmap_expected[sb->nblocks];
  int datastart = sb->bmapstart + 1;
  for (int i = 0; i < sb->nblocks; i++)
    bitmap_expected[i] = 0;
  // Initialize expected and actual map of which inodes are used
  int inodes_used_expected[sb->ninodes];
  int inodes_used_actual[sb->ninodes];
  for (int i = 0; i < sb->ninodes; i++)
    inodes_used_expected[i] = inodes_used_actual[i] = 0;

  // Iterate over all inodes
  struct dinode *inode = inode_base;
  for (int i = 0; i < sb->ninodes; i++, inode++)
  {
    // Check for root directory
    int root_flag = i == ROOTINO;
    if (root_flag && inode->type != T_DIR)
      panic("ERROR: root directory does not exist.\n");
    // Check inode type
    if (inode->type == 0)
      continue;
    // if (inode->type != T_FILE && inode->type != T_DIR && inode->type != T_DEV)
    panic("ERROR: bad inode.\n");
    // Increment uses of inode
    inodes_used_actual[i]++;

    // Iterate overall direct blocks
    int num_blocks = get_num_blocks(inode);
    int dot = 0, dot_dot = 0;
    for (int j = 0; j < min(num_blocks, NDIRECT); j++)
    {
      uint block = inode->addrs[j];
      if (block == 0)
        continue;
      if (!is_data_block(block, sb))
        panic("ERROR: bad direct address in inode.\n");
      // If inode is for root, make sure its parent points to itself
      if (root_flag)
        root_flag = !check_root(block, img_ptr); // unset if parent dir is good
      // Check that dir has . and .. and increment used entries
      if (inode->type == T_DIR)
      {
        check_dir(block, i, &dot, &dot_dot, inodes_used_expected, img_ptr);
        if (inode->nlink > 1)
          panic("ERROR: directory appears more than once in file system.\n");
      }
      // If some inode has already used this block, panic
      if (bitmap_expected[block - datastart])
        panic("ERROR: direct address used more than once.\n");
      // Otherwise, mark block as used in expected bitmap
      bitmap_expected[block - datastart] = 1;
    }

    // Check indirect block address
    num_blocks -= NDIRECT;
    uint indirect_block = inode->addrs[NDIRECT];
    if (indirect_block != 0)
    {
      if (!is_data_block(indirect_block, sb))
        panic("ERROR: bad indirect address in inode.\n");
      if (bitmap_expected[indirect_block - datastart])
        panic("ERROR: indirect address used more than once.\n");
      bitmap_expected[indirect_block - datastart] = 1;
      // Check indirect block contents
      uint *block = (uint *)(img_ptr + indirect_block * BSIZE);
      for (int j = 0; j < num_blocks; j++, block++)
      {
        if (*block == 0)
          continue;
        if (!is_data_block(*block, sb))
          panic("ERROR: bad indirect address in inode.\n");
        if (root_flag)
          root_flag = !check_root(*block, img_ptr); // unset if parent dir is good
        if (inode->type == T_DIR)
        {
          check_dir(*block, i, &dot, &dot_dot, inodes_used_expected, img_ptr);
          if (inode->nlink > 1)
            panic("ERROR: directory appears more than once in file system.\n");
        }
        if (bitmap_expected[*block - datastart])
          panic("ERROR: indirect address used more than once.\n");
        bitmap_expected[*block - datastart] = 1;
      }
    }
    // Check that we found . and .. in dir
    if (inode->type == T_DIR && (!dot || !dot_dot))
      panic("ERROR: directory not properly formatted.\n");
  }

  // Check that expected bitmap matches the actual bitmap
  for (int i = 0; i < sb->nblocks; i++)
  {
    int bit_actual = read_bitmap(i + datastart, sb);
    if (!bitmap_expected[i] && bit_actual)
      panic("ERROR: bitmap marks block in use but it is not in use.\n");
    if (bitmap_expected[i] && !bit_actual)
      panic("ERROR: address used by inode but marked free in bitmap.\n");
  }
  // Check that inodes expected to be in use match those actually in use
  inode = inode_base;
  for (int i = 0; i < sb->ninodes; i++, inode++)
  {
    int actual = inodes_used_actual[i], expected = inodes_used_expected[i];
    if (actual && !expected)
      panic("ERROR: inode marked use but not found in a directory.\n");
    if (!actual && expected)
      panic("ERROR: inode referred to in directory but marked free.\n");
    if (actual != inode->nlink || (actual != expected && i != ROOTINO))
      panic("ERROR: bad reference count for file.\n");
    if (inode->type == T_DIR && inode->nlink > 1)
      panic("ERROR: directory appears more than once in file system.\n");
  }
}

int main(int argc, char **argv)
{
  // Open input file
  if (argc < 2)
    panic("Usage: xcheck <file_system_image>\n");
  int fd = open(argv[1], O_RDONLY);
  if (fd == -1)
    panic("image not found.\n");

  // Map file system image into memory
  struct stat sbuf;
  assert(fstat(fd, &sbuf) == 0);
  void *img_ptr = mmap(NULL, sbuf.st_size, PROT_READ, MAP_PRIVATE, fd, 0);
  assert(img_ptr != MAP_FAILED);
  close(fd);

  // Get superblock
  struct superblock *sb;
  sb = (struct superblock *)(img_ptr + BSIZE);
  // Save important addresses
  inode_base = (struct dinode *)(img_ptr + sb->inodestart * BSIZE);
  bmap_base = (char *)(img_ptr + sb->bmapstart * BSIZE);

  check_filesystem(sb, img_ptr);
  munmap(img_ptr, sbuf.st_size);
  return 0;
}