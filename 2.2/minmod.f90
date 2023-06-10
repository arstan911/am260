module minmod
use utility

implicit none
contains 
   subroutine minmod_limiter(dx,uL,uC,uR,delta)
   use utility
   implicit none 
   real(dp), intent(in) :: uL, uR, uC, dx
   real(dp), intent(out) :: delta
   real(dp) :: a, b

   a = (uC-uL)/dx
   b = (uR-uC)/dx

   if ((ABS(a)<=ABS(b)) .AND. (a*b > 0.0)) then
       delta = a
   else if ((ABS(a)>ABS(b)) .AND. (a*b > 0.0)) then
       delta = b
   else if (a*b<=0.0) then
       delta = 0.0
   endif

   end subroutine minmod_limiter

end module minmod