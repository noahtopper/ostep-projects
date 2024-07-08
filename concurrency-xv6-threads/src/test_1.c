#include "types.h"
#include "stat.h"
#include "user.h"
#include "lock.h"

int x;
lock_t *mutex;

void child(void *arg1, void *arg2)
{
  int loops = (int)arg1;
  int inc = (int)arg2;
  for (int i = 0; i < loops; i++)
  {
    lock_acquire(mutex);
    x += inc;
    lock_release(mutex);
  }
  exit();
}

int
main(int argc, char *argv[])
{
  mutex = malloc(sizeof(lock_t));
  lock_init(mutex);
  x = 0;

  thread_create(child, (void*)10, (void*)1);
  thread_join();
  printf(1, "x = %d\n", x);

  free(mutex);
  exit();
}
