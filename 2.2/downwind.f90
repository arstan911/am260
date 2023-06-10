module downwind
use utility

implicit none
contains 
   subroutine downwind_limiter(dx,uL, uR,delta)
   use utility
   implicit none 
   real(dp), intent(in) :: uL, uR, dx
   real(dp), intent(out) :: delta

   delta = (uR-uL)/dx

   end subroutine downwind_limiter

end module downwind