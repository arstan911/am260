module write_data
implicit none

contains 
 subroutine output_data()
     implicit none
     integer :: i, j
     open(20, file = "output.dat", status = "replace")
     !!! fix this time iterations 
     do i = 1, tN
         write(20,*) t(i), (u(i,j), j = 1, N)
     end do
     close(20)
 end subroutine output_data

 end module write_data