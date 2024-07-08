#include <fcntl.h>
#include <math.h>
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <sys/sysctl.h>
#include <sys/types.h>
#include <unistd.h>
#include "globals.h"

void do_fill(chunk *c)
{
    buffer[fill_ptr] = c;
    fill_ptr = (fill_ptr + 1) % BUFFER_SIZE;
    num_full++;
}

chunk *do_get()
{
    chunk *c = buffer[use_ptr];
    use_ptr = (use_ptr + 1) % BUFFER_SIZE;
    num_full--;
    return c;
}

int get_ncpus()
{
    int mib[2], numCPUs;
    size_t len;

    // Set the mib (Management Information Base) array to query the number of CPUs
    mib[0] = CTL_HW;
    mib[1] = HW_NCPU;
    // Get the size of the result
    len = sizeof(numCPUs);
    // Retrieve the number of CPUs
    sysctl(mib, 2, &numCPUs, &len, NULL, 0);

    return numCPUs;
}

void *producer(void *arg)
{
    producer_arg *args = (producer_arg *) arg;
    // Map file into memory
    void *address = mmap(NULL, args->file_size, PROT_READ, MAP_PRIVATE, args->fd, 0);
    if (address == MAP_FAILED)
    {
        printf("pzip: error mapping file '%s' into memory\n", args->filename);
        exit(1);
    }

    // Place chunks in buffer
    int base = args->id * args->num_chunks;
    for (int i = 0; i < args->num_chunks; i++)
    {
        // Create chunk of work
        // Each chunk should be CHUNK_SIZE, except maybe data in last chunk
        off_t chunk_size = CHUNK_SIZE;
        if (i == args->num_chunks - 1 && args->file_size % CHUNK_SIZE != 0)
            chunk_size = args->file_size % CHUNK_SIZE;
        chunk *c = malloc(sizeof(chunk));
        c->id = base + i;
        c->size = chunk_size;
        c->addr = address;
        address += chunk_size;

        pthread_mutex_lock(&lock);
        // Wait for buffer to have empty slot
        while (num_full == BUFFER_SIZE)
            pthread_cond_wait(&empty, &lock);
        // Fill in slot with file chunk
        do_fill(c);
        pthread_cond_signal(&fill);
        pthread_mutex_unlock(&lock);
    }
    close(args->fd);
    return NULL;
}

void *consumer(void *arg)
{
    chunk *c = NULL;
    while (1)
    {
        pthread_mutex_lock(&lock);
        // Wait for buffer to have a filled slot
        while (num_full == 0)
            pthread_cond_wait(&fill, &lock);
        c = do_get();
        pthread_cond_signal(&empty);
        pthread_mutex_unlock(&lock);
        
        // Stop consuming if we see EOS token
        if (c == EOS)
            break;
        // Compress data into linked list and insert in output
        output[c->id] = zip_to_list(c);
        free(c);
    }
    return NULL;
}

int main(int argc, char **argv)
{
    // Check input format
    if (argc < 2)
    {
        printf("pzip: file1 [file2 ...]\n");
        exit(1);
    }

    // Open each file and construct producer arguments
    int *file_descriptors = malloc(sizeof(int) * (argc - 1));
    producer_arg *producer_args = malloc(sizeof(producer_arg) * (argc - 1));
    int total_chunks = 0;
    for (int i = 0; i < argc - 1; i++)
    {
        // Open and save file descriptor
        file_descriptors[i] = open(argv[i+1], O_RDONLY);
        if (file_descriptors[i] == -1)
        {
            printf("pzip: cannot open file '%s'\n", argv[i+1]);
            exit(1);
        }
        // Get stat struct on file
        struct stat file_stats;
        if (fstat(file_descriptors[i], &file_stats) == -1)
        {
            printf("pzip: error getting stats on file '%s'\n", argv[i+1]);
            exit(1);
        }
        // Construct producer argument
        off_t file_size = file_stats.st_size;
        producer_args[i].fd = file_descriptors[i];
        producer_args[i].file_size = file_size;
        producer_args[i].num_chunks = (int)ceil((double)file_size / CHUNK_SIZE);
        producer_args[i].filename = argv[i+1];
        producer_args[i].id = i;
        // Count total number of chunks for output array
        total_chunks += producer_args[i].num_chunks;
    }
    free(file_descriptors);

    // Create and init work buffer and output array
    buffer = malloc(sizeof(chunk*) * BUFFER_SIZE);
    for (int i = 0; i < BUFFER_SIZE; i++)
        buffer[i] = NULL;
    output = malloc(sizeof(zip_list*) * total_chunks);
    for (int i = 0; i < total_chunks; i++)
        output[i] = NULL;

    // Create one producer per input file
    pthread_t *pid = malloc(sizeof(pthread_t) * (argc - 1));
    for (int i = 0; i < argc - 1; i++)
        pthread_create(&pid[i], NULL, producer, &producer_args[i]);
    // Create one consumer per CPU
    int num_cpus = get_ncpus();
    pthread_t *cid = malloc(sizeof(pthread_t) * (num_cpus));
    for (int i = 0; i < num_cpus; i++)
        pthread_create(&cid[i], NULL, consumer, NULL);

    // Wait for producers to finish
    for (int i = 0; i < argc - 1; i++)
        pthread_join(pid[i], NULL);
    // Free producer memory
    free(producer_args);
    free(pid);

    // Add EOS token for each consumer
    for (int i = 0; i < num_cpus; i++)
    {
        pthread_mutex_lock(&lock);
        while (num_full == BUFFER_SIZE)
            pthread_cond_wait(&empty, &lock);
        do_fill(EOS);
        pthread_cond_signal(&fill);
        pthread_mutex_unlock(&lock);
    }

    // Wait for consumers to finish
    for (int i = 0; i < num_cpus; i++)
        pthread_join(cid[i], NULL);
    // Free buffer and consumer memory
    free(buffer);
    free(cid);
    
    int count = 0;
    char saved = -1;
    for (int i = 0; i < total_chunks; i++)
    {
        node *n = output[i]->head;
        // If current node matches end of previous list, add together
        if (saved == n->c)
            n->count += count;
        // Otherwise, write previous node
        else if (count > 0)
        {
            fwrite(&count, sizeof(int), 1, stdout);
            fprintf(stdout, "%c", saved);
        }
        // Write each node of list in binary format except the last
        while (n->next != NULL)
        {
            fwrite(&n->count, sizeof(int), 1, stdout);
            fprintf(stdout, "%c", n->c);
            n = n->next;
        }
        // Save contents of last node
        count = n->count;
        saved = n->c;
    }
    // Write final pending node
    fwrite(&count, sizeof(int), 1, stdout);
    fprintf(stdout, "%c", saved);
    
    // Free output array memory
    for (int i = 0; i < total_chunks; i++)
        destroy_list(output[i]);
    free(output);
    return 0;
}