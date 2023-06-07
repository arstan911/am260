module bc

use utility

implicit none

contains 
  subroutine bc_outflow(x,u)
     use utility
     implicit none 

     real(dp), dimension(:), allocatable, intent(in) :: x
     real(dp), dimension(:), allocatable, intent(inout) :: u
     
     u(1) = u(3)
     u(2) = u(3)
     u(size(x)-1) = u(size(x)-2)
     u(size(x)) = u(size(x)-2)

    end subroutine bc_outflow

    
end module bc 


