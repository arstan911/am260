module advect_update
use utility

implicit none

contains 

    subroutine advect_update_sr(method, lim, dx)
     use utility
     implicit none
     character(len=80), intent(in) :: method
     integer, intent(in) :: lim
     real(dp), intent(in):: dx

     if (method == "FOG") then
       print*, 'ok ok ok',dx
     endif

     if (lim == 0) then
       print*, 'okokokokok', dx
     endif

    end subroutine advect_update_sr


end module advect_update