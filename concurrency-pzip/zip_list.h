typedef struct node
{
    int count;
    char c;
    struct node *next;
} node;

typedef struct
{
    node *head;
    node *tail;
} zip_list;

zip_list *create_list()
{
    zip_list *list = malloc(sizeof(zip_list));
    list->head = NULL;
    list->tail = NULL;
    return list;
}

node *create_node(int count, char c)
{
    node *n = malloc(sizeof(node));
    n->count = count;
    n->c = c;
    n->next = NULL;
    return n;
}

void insert(zip_list *list, node *n)
{
    if (list->head == NULL)
    {
        list->head = list->tail = n;
        return;
    }
    list->tail->next = n;
    list->tail = n;
}

node *destroy_list(zip_list *list)
{
    node *next, *current = list->head;
    while (current != NULL)
    {
        next = current->next;
        free(current);
        current = next;
    }
    free(list);
    return NULL;
}

// Compress chunk into zip_list
zip_list *zip_to_list(chunk *c)
{
    int count = 1;
    char curr, saved = c->addr[0];
    zip_list *list = create_list();
    for (int i = 1; i < c->size; i++)
    {
        curr = c->addr[i];
        if (curr == saved)
            count++;
        else
        {
            node *n = create_node(count, saved);
            insert(list, n);
            saved = curr;
            count = 1;
        }
    }
    node *n = create_node(count, saved);
    insert(list, n);
    return list;
}