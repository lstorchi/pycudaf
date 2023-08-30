c-----------------------------------------------------------------------
      subroutine gfinit()
c-----------------------------------------------------------------------

      use funfm, only: ninter, fm, t, maxl

      implicit none

      integer :: i, j

#ifdef USE_CASE2
      allocate(fm(ninter,maxl))
      allocate(t(ninter))
#endif

      do i = 1,ninter
        t(i) = 2.0d0
        do j = 1,maxl
          fm(i,j) = 1.0d0
        end do
      end do
#ifdef USE_CASE1
!$acc enter data create(fm,t)
#endif
!$acc update device(fm, t)
      return

      end subroutine gfinit
