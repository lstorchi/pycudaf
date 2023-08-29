#include <string.h>
#include <stdio.h>


#define f_thresh bertha_wrapper_get_thresh_

void bertha_wrapper_set_thresh_ (double *);

double get_thresh ()
{
  double val;
  f_thresh (&val);

  return val;
}
