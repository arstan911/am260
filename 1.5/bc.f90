module bc

use utility

implicit none

contains 
  subroutine bc_outflow(N,u)
     use utility
     implicit none 

     !real(dp), dimension(:), allocatable, intent(in) :: x
     integer, intent(in) :: N
     real(dp), dimension(:), allocatable, intent(inout) :: u
     
     u(1) = u(3)
     u(2) = u(3)
     u(N+3) = u(N+2)
     u(N+4) = u(N+2)

    end subroutine bc_outflow

    
end module bc 


