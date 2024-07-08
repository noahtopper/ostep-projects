// Either holds a value string or a key_to_values struct in data
typedef struct node
{
    void *data;
    struct node *next;
} node;
// Holds list of nodes
typedef struct
{
    node *head;
    node *tail;
} list;
// Special struct to hold a key and the list of values it maps to
typedef struct
{
    char *key;
    list *values;
} key_to_values;

list *create_list()
{
    list *l = malloc(sizeof(list));
    l->head = l->tail = NULL;
    return l;
}

node *create_value_node(char *value)
{
    node *n = malloc(sizeof(node));
    n->data = (void*)value;
    n->next = NULL;
    return n;
}

node *create_key_to_values_node(char *key)
{
    node *n = malloc(sizeof(node));
    key_to_values *k = malloc(sizeof(key_to_values));
    k->key = key;
    k->values = create_list();
    n->data = (void*)k;
    n->next = NULL;
    return n;
}

node *destroy_value_node(node *n)
{
    if (n == NULL)
        return NULL;
    assert(n->data != NULL);
    free(n->data);
    free(n);
    return NULL;
}

// Assumes l is a list of value nodes
list *destroy_value_list(list *l)
{
    if (l == NULL)
        return NULL;
    node *next, *current = l->head;
    while (current != NULL)
    {
        next = current->next;
        destroy_value_node(current);
        current = next;
    }
    free(l);
    return NULL;
}

node *destroy_key_to_values_node(node *n)
{
    if (n == NULL)
        return NULL;
    key_to_values *k = (key_to_values*)n->data;
    assert(k != NULL);
    destroy_value_list(k->values);
    free(k->key);
    free(k);
    free(n);
    return NULL;
}

// Assumes that l is a list of key_to_values nodes
list *destroy_partition(list *l)
{
    if (l == NULL)
        return NULL;
    node *next, *current = l->head;
    while (current != NULL)
    {
        next = current->next;
        destroy_key_to_values_node(current);
        current = next;
    }
    free(l);
    return NULL;
}

void tail_insert(list *l, node *n)
{
    if (l == NULL)
        return;
    assert(n != NULL);
    if (l->head == NULL)
    {
        l->head = l->tail = n;
        return;
    }
    l->tail->next = n;
    l->tail = n;
}

node *pop_head(list *l)
{
    if (l == NULL)
        return NULL;
    node *n = l->head;
    if (l->head != NULL)
        l->head = l->head->next;
    return n;
}

void sort_partition(list *l)
{
    return;
}

void print_list(list *l)
{
    if (l == NULL)
        return;
    node *curr = l->head;
    printf("{");
    while (curr != NULL)
    {
        printf("%s, ", (char*)curr->data);
        curr = curr->next;
    }
    printf("}\n");
}

void print_partition(list *l)
{
    if (l == NULL)
        return;
    node *curr = l->head;
    while (curr != NULL)
    {
        key_to_values *k = (key_to_values*)curr->data;
        printf("%s -> ", k->key);
        print_list(k->values);
        curr = curr->next;
    }
}