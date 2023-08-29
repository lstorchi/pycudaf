      program bertha

      use bertha_wrapper, only : bertha_main

      use cublas
      use cusolverDn
      use cudafor

      implicit none

      call bertha_main ()

      end program bertha
