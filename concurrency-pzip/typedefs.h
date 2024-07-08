typedef struct
{
    int fd;
    int id;
    char *filename;
    off_t file_size;
    int num_chunks;
} producer_arg;

typedef struct
{
    char *addr;
    int id;
    off_t size;
} chunk;