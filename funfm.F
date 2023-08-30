      module funfm

      implicit none
      private

      integer, parameter, public :: ninter = 1000
      integer, parameter, public :: maxl = 400
#ifdef USE_CASE2
      real, public, dimension(:,:), allocatable :: fm
      real, public, dimension(:), allocatable :: t
!$acc declare create(fm,t)

#else
      real, public :: fm(ninter,maxl)
#if !defined(USE_CASE1)
!$acc declare create(fm)
#endif
      real, public :: t(ninter)
#if !defined(USE_CASE1)
!$acc declare create(t)
#endif

#endif
      end module funfm
