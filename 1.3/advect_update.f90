module advect_update
use utility

implicit none

contains 

    subroutine advect_update_sr(method,lim)
     use utility
     implicit none
     character(len=80), intent(in) :: method
     integer, intent(in) :: lim

     if (method == "FOG") then
       print*, 'ok ok ok'
     endif

     if (lim == 0) then
       print*, 'okokokokok'
     endif
    end subroutine advect_update_sr


end module advect_update