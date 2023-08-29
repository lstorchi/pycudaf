      module bertha_wrapper

      use, intrinsic :: iso_c_binding
      use cublas
      use cusolverDn
      use cudafor

      implicit none

      real :: thresh
      public :: get_thresh

      contains

ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc

      subroutine get_thresh (in)
      implicit none
      real, intent(out) :: in
      in = thresh
      end subroutine get_thresh

ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc

      subroutine bertha_main()

      implicit none

      call gfinit()

      thresh = 1.0e-5

      end subroutine 

ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc

      end module
