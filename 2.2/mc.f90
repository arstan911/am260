module mc
use utility

implicit none
contains 
   subroutine mc_limiter(dx,uL,uC,uR,delta)
   use utility
   use minmod
   implicit none 
   real(dp), intent(in) :: uL, uR, uC, dx
   real(dp), intent(out) :: delta
   real(dp) :: a, b,c,mmAB

   a = 0.5*(uR-uL)/dx
   b = 2*(uR-uC)/dx
   c = 2*(uC-uL)/dx
   
   call minmod_f(a,b,mmAB)

   if ((ABS(mmAB)<=ABS(c)) .AND. (mmAB*c > 0.0)) then
       delta = mmAB
   else if ((ABS(mmAB)>ABS(c)) .AND. (mmAB*c > 0.0)) then
       delta = c
   else if (a*b<=0.0) then
       delta = 0.0
   endif

   end subroutine mc_limiter


   subroutine minmod_f(a,b,mm)
   use utility
   implicit none
   real(dp), intent(in) :: a,b
   real(dp), intent(out) :: mm

   if ((ABS(a)<=ABS(b)) .AND. (a*b > 0.0)) then
       mm = a
   else if ((ABS(a)>ABS(b)) .AND. (a*b > 0.0)) then
       mm = b
   else if (a*b<=0.0) then
       mm = 0.0
   endif
   end subroutine minmod_f


end module mc