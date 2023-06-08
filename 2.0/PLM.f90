module PLM
use utility
use cfl 
implicit none

contains
    subroutine PLM_updater(Ca,dx,t0,tf,N,u)
     use utility
     use cfl
     use bc

     implicit none

     real(dp), dimension(:), allocatable :: u
     real(dp), intent(in) :: t0,tf,Ca,dx
     real(dp), dimension(:),allocatable :: u_buf
     integer, intent(in) :: N
     real(dp) :: dt_new, t, flux_R, flux_L, sl, sr
     integer :: i,j






    end subroutine PLM_updater

end module PLM