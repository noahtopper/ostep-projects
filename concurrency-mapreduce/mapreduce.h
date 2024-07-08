#ifndef __mapreduce_h__
#define __mapreduce_h__

#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>

#include "buffer.h"
#include "function_pointers.h"
#include "globals.h"

// Internal functions
// Returns the name of the next unmapped file
char *get_file()
{
	if (curr_file < num_files)
		return files[++curr_file];
	return NULL;
}

// Returns the next string value for the given key
char *get_next(char *key, int partition_number)
{
	node *curr = partitions[partition_number]->head;
	key_to_values *data = NULL;
	int match = 0;
	// Search partition for key
	while (curr != NULL)
	{
		data = (key_to_values*)curr->data;
		if (strcmp(key, data->key) == 0)
		{
			match = 1;
			break;
		}
		curr = curr->next;
	}
	// key must be present in partition
	assert(match);
	// Pop value node and return string
	node *n = pop_head(data->values);
	if (n == NULL)
		return NULL;
	char *value = strdup((char*)n->data);
	// Destroy node since it's no longer in list
	destroy_value_node(n);
	return value;
}

// Calls mapper on a file from argv until all are consumed
void *map_thread(void *arg)
{
	while (1)
	{
		pthread_mutex_lock(&argv_lock);
		// If all files have been consumed, break
		if (curr_file >= num_files)
		{
			pthread_mutex_unlock(&argv_lock);
			break;
		}
		char *filename = get_file();
		pthread_mutex_unlock(&argv_lock);
		mapper(filename);
	}
	return NULL;
}

void *reduce_thread(void *arg)
{
	int partition_number = (int)arg;
	// Sort the keys in the given partition of the central data structure.
	list *partition = partitions[partition_number];
	sort_partition(partition);
	// Iteratively call reduce on each key in the partition.
	node *curr = partition->head;
	while (curr != NULL)
	{
		key_to_values *data = (key_to_values*)curr->data;
		reducer(data->key, get_next, partition_number);
		curr = curr->next;
	}
	return NULL;
}

// External functions
void MR_Emit(char *key, char *value)
{
	// Compute the appropriate partition for key using the partition function.
	int partition_number = partition_func(key, num_partitions);
	// Create copies of each key and value
	key = strdup(key);
	value = strdup(value);
	// Insert (key, value) pair into the central data structure.
	// Acquire lock on specific partition
	pthread_mutex_lock(&partition_locks[partition_number]);
	list *partition = partitions[partition_number];
	node *curr = partition->head;
	key_to_values *data = NULL;
	int match = 0;
	// Search partition for key
	while (curr != NULL)
	{
		data = (key_to_values*)curr->data;
		if (strcmp(key, data->key) == 0)
		{
			match = 1;
			break;
		}
		curr = curr->next;
	}
	// If no match found, insert key into partition
	if (!match)
	{
		node *n = create_key_to_values_node(key);
		data = (key_to_values*)n->data;
		tail_insert(partition, n);
	}
	// Insert value into list of values associated with key
	tail_insert(data->values, create_value_node(value));
	pthread_mutex_unlock(&partition_locks[partition_number]);
}

// Default partition function
unsigned long MR_DefaultHashPartition(char *key, int num_partitions)
{
    unsigned long hash = 5381;
    int c;
    while ((c = *key++) != '\0')
    	hash = hash * 33 + c;
    return hash % num_partitions;
}

void MR_Run(int argc, char *argv[], Mapper map, int num_mappers, Reducer reduce,
			int num_reducers, Partitioner partition)
{
	// Initialize all global variables
	// Partition function
	partition_func = partition;
	num_partitions = num_reducers;
	// Mapper and reducer
	mapper = map;
	reducer = reduce;
	// Locks
	partition_locks = malloc(sizeof(pthread_mutex_t) * num_partitions);
	for (int i = 0; i < num_partitions; i++)
		pthread_mutex_init(&partition_locks[i], NULL);
	// argv buffer
	files = argv;
	curr_file = 0;
	num_files = argc - 1;
	// Central buffer
	partitions = malloc(sizeof(list*) * num_partitions);
	for (int i = 0; i < num_partitions; i++)
		partitions[i] = create_list();

	// Create mapper threads
	pthread_t *mappers = malloc(sizeof(pthread_t) * num_mappers);
	for (int i = 0; i < num_mappers; i++)
		pthread_create(&mappers[i], NULL, map_thread, (void*)map);
	// Wait for mappers to finish
	for (int i = 0; i < num_mappers; i++)
		pthread_join(mappers[i], NULL);
	free(mappers);

	// Create reducer threads each w/ a different partition number
	pthread_t *reducers = malloc(sizeof(pthread_t) * num_reducers);
	for (int i = 0; i < num_reducers; i++)
		pthread_create(&reducers[i], NULL, reduce_thread, (void*)i);
	// Wait for reducers to finish
	for (int i = 0; i < num_reducers; i++)
		pthread_join(reducers[i], NULL);

	// Clean up
	for (int i = 0; i < num_partitions; i++)
	{
		pthread_mutex_destroy(&partition_locks[i]);
		partitions[i] = destroy_partition(partitions[i]);
	}
	free(partition_locks);
	free(partitions);
	free(reducers);
}

#endif // __mapreduce_h__
