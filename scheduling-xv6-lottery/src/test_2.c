#include "types.h"
#include "stat.h"
#include "user.h"
#include "pstat.h"

int
main(int argc, char *argv[]) {
  int i, rc1, rc2, rc3, pid;
  struct pstat p;

  if ((rc1 = fork()) == 0)
  {
    settickets(30);
    while (1)
      ;
  }
  else if ((rc2 = fork()) == 0)
  {
    settickets(20);
    while (1)
      ;
  }
  else if ((rc3 = fork()) == 0)
  {
    settickets(10);
    while (1)
      ;
  }
  while (1)
  {
    sleep(1);
    getpinfo(&p);
    for(i = 0; i < NPROC; i++)
    {
      pid = p.pid[i];
      if(pid == rc1 || pid == rc2 || pid == rc3)
        printf(1, "Process %d has %d tickets and has run for %d ticks\n", pid, p.tickets[i], p.ticks[i]);
    }
    printf(1, "\n");
  }
}
