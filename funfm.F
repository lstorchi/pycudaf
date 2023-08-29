      module funfm

      implicit none
      private

      integer, parameter, public :: ninter = 1000
      integer, parameter, public :: maxl = 400
      real, public :: fm(ninter,maxl)
#ifdef USECUDANV
!$acc declare create(fm)
#endif
      real, public :: t(ninter)
#ifdef USECUDANV
!$acc declare create(t)
#endif
      end module funfm
