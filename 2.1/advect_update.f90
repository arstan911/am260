module advect_update
use utility
use FOG
use cfl
use bc
use PLM

implicit none

contains 

    subroutine advect_update_sr(method, lim,Ca, dx, N,t0,tf,u)
     use utility
     implicit none
     character(len=80), intent(in) :: method
     integer, intent(in) :: lim, N
     real(dp), intent(in):: dx, t0, tf, Ca
     real(dp), dimension(:), allocatable, intent(in) :: u

     if (method == "FOG") then
        call FOG_updater(Ca,dx,t0,tf,N,u)
     else
        call PLM_updater(lim,Ca,dx,t0,tf,N,u)
     endif

    

    end subroutine advect_update_sr


end module advect_update