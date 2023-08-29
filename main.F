      program bertha

      use bertha_wrapper, only : bertha_main, get_thresh

      use cublas
      use cusolverDn
      use cudafor

      implicit none

      real :: val

      call get_thresh (val)
      print *, val

      call bertha_main ()

      call get_thresh (val)
      print *, val

      end program bertha
