c-----------------------------------------------------------------------
      subroutine gfinit()
c-----------------------------------------------------------------------

      use funfm, only: ninter, fm, t, maxl

      implicit none

      integer :: i, j

      do i = 1,ninter
        t(i) = 2.0d0
        do j = 1,maxl
          fm(i,j) = 1.0d0
        end do
      end do
#ifdef USECUDANV
!$acc update device(fm, t)
#endif
      return

      end subroutine gfinit
