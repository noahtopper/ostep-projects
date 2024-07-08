// Partition function
Partitioner partition_func;
int num_partitions;
// Mapper and reducer
Mapper mapper;
Reducer reducer;
// Locks
pthread_mutex_t argv_lock = PTHREAD_MUTEX_INITIALIZER;
pthread_mutex_t *partition_locks;
// argv buffer
char **files;
int curr_file;
int num_files;
// Central buffer
// (should be allocated as an array of lists of key_to_values nodes)
list **partitions;