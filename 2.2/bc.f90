module bc

use utility

implicit none

contains 
  subroutine bc_outflow(N,u)
     use utility
     implicit none 

     integer, intent(in) :: N
     real(dp), dimension(:), allocatable, intent(inout) :: u
     
     u(1) = u(3)
     u(2) = u(3)
     u(N+3) = u(N+2)
     u(N+4) = u(N+2)

    end subroutine bc_outflow


    subroutine bc_periodic(N,u)
     use utility
     implicit none 

     integer, intent(in) :: N
     real(dp), dimension(:), allocatable, intent(inout) :: u
     
     u(1) = u(N+1)
     u(2) = u(N+2)
     u(N+3) = u(3)
     u(N+4) = u(4)
    end subroutine bc_periodic



    
end module bc 


