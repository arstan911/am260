module FOG
use utility
use cfl 

implicit none 

contains 
   subroutine FOG_updater(Ca,dx,t0,tf,N,u)
     use utility
     use cfl
     use bc

     implicit none 
     real(dp), dimension(:), allocatable :: u
     real(dp), intent(in) :: t0,tf,Ca,dx
     real(dp), dimension(:),allocatable :: u_buf
     integer, intent(in) :: N
     real(dp) :: dt_new, t
     integer :: i,j

     allocate(u_buf(N+4))
     u_buf = u
     t = t0
     open(20, file = "output_FOG.dat")
     write(20,*) t, (u_buf(j), j = 1,N+4)
     DO WHILE (t <= tf)
         u_buf = u
         call cfl_update(N,Ca,dx,u_buf,dt_new)
        
         do i = 2,N+4
             u_buf(i) = u(i) - dt_new/dx*0.5*(u(i)**2 - u(i-1)**2)
         enddo

         call bc_outflow(N,u_buf)
         t = t+dt_new
         write(20,*) t, (u_buf(j), j = 1,N+4)
         
         u = u_buf
         
       END DO
      close(20)

    end subroutine FOG_updater

end module FOG


