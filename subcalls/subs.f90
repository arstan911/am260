module subs
 use utility, only: dp
 implicit none 

contains

  subroutine summation(a,b,sum)
     implicit none 
     
     real(dp), intent(in):: a,b
     real(dp), intent(out) :: sum

     sum = a+b 

  end subroutine summation

  end module subs