module vanLeers
use utility

implicit none
contains 
   subroutine vanleers_limiter(dx,uL,uC,uR,delta)
   use utility
   implicit none 
   real(dp), intent(in) :: uL, uR, uC, dx
   real(dp), intent(out) :: delta
   real(dp) :: a, b

   a = (uC-uL)/dx
   b = (uR-uC)/dx

   if (a*b > 0.0) then
       delta = 2*a*b/(a+b)
   else if (a*b <= 0.0) then
       delta = 0
   endif

   end subroutine vanleers_limiter

end module vanLeers