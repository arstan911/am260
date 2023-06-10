module centered
use utility

implicit none
contains 
   subroutine centered_limiter(dx,uL, uR,delta)
   use utility
   implicit none 
   real(dp), intent(in) :: uL, uR, dx
   real(dp), intent(out) :: delta

   delta = (uR-uL)/2*dx

   end subroutine centered_limiter

end module centered