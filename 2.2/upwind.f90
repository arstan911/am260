module upwind
use utility

implicit none
contains 
   subroutine upwind_limiter(dx,uL, uR,delta)
   use utility
   implicit none 
   real(dp), intent(in) :: uL, uR, dx
   real(dp), intent(out) :: delta

   delta = (uR-uL)/dx

   end subroutine upwind_limiter

end module upwind