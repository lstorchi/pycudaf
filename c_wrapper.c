#include <string.h>
#include <stdio.h>

#define f_thresh bertha_wrapper_get_thresh_
#define f_bertha_main bertha_wrapper_bertha_main_

void f_thresh (double *);
void f_bertha_main ();

double get_thresh ()
{
  double val;
  f_thresh (&val);

  return val;
}

int mainrun()
{
  f_bertha_main();

  return 0;
}

