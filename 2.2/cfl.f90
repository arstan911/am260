module cfl
use utility

implicit none


contains 
   subroutine cfl_update(N,Ca,dx,u,dt_new)
     use utility
     implicit none
     real(dp), intent(in) :: dx,Ca
     integer, intent(in) :: N
     real(dp), intent(out) :: dt_new
     real(dp) :: S_max
     real(dp), dimension(:), allocatable, intent(in) :: u
     real(dp), dimension(:), allocatable :: S
     integer::i

     allocate(S(N+3))
     
     do i = 1,N+3
         S(i) = 0.5*(u(i)+u(i+1))
     enddo
     
     S_max = MAXVAL(S)
     dt_new = dx*Ca/S_max


   end subroutine cfl_update


end module cfl