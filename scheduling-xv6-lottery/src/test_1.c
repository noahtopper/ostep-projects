#include "types.h"
#include "stat.h"
#include "user.h"
#include "pstat.h"

int
main(int argc, char *argv[]) {
  int i;
  struct pstat p;
  settickets(10);
  getpinfo(&p);
  for(i = 0; i < NPROC; i++){
    if(p.inuse[i]){
        printf(1, "Process %d has %d tickets\n", p.pid[i], p.tickets[i]);
    }
  }
  exit();
}
