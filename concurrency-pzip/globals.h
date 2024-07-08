#include "typedefs.h"
#include "zip_list.h"

// Constants
#define CHUNK_SIZE 1000000
#define BUFFER_SIZE 100
chunk *EOS = (chunk*)-1;

// Buffer and output variables
int num_full = 0;
int use_ptr = 0;
int fill_ptr = 0;
chunk **buffer;
zip_list **output;

// Initialize lock and condition variables
pthread_mutex_t lock = PTHREAD_MUTEX_INITIALIZER;
pthread_cond_t fill = PTHREAD_COND_INITIALIZER;
pthread_cond_t empty = PTHREAD_COND_INITIALIZER;