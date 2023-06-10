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
     real(dp) :: dt_new, t, flux_R, flux_L, sl, sr
     integer :: i,j

     allocate(u_buf(N+4))
     u_buf = u
     t = t0
     open(20, file = "output_FOG.dat")
     write(20,*) t, (u_buf(j), j = 1,N+4)
     DO WHILE (t <= tf)
         u_buf = u
         call cfl_update(N,Ca,dx,u_buf,dt_new)
         
         do i = 2,N+3
             sl = 0.5*(u(i)+u(i-1))
             if (u(i-1) >= u(i)) then
                 if (sl >= 0.0) then
                     flux_L = 0.5*u(i-1)**2
                 else if (sl < 0.0) then
                     flux_L = 0.5*u(i)**2
                 endif
             else
                 if (u(i-1)>= 0.0) then
                     flux_L = 0.5*u(i-1)**2
                 else if ((u(i-1)<0.0) .AND. (u(i)>0.0)) then
                     flux_L = 0.0
                 else if ((u(i) <= 0.0)) then
                     flux_L = 0.5*u(i)**2
                 endif
             endif

             sr = 0.5*(u(i)+u(i+1))

             if (u(i) >= u(i+1)) then
                 if (sr >= 0.0) then
                     flux_R = 0.5*u(i)**2
                 else if (sr < 0.0) then
                     flux_R = 0.5*u(i+1)**2
                 endif
             else
                 if (u(i)>= 0.0) then
                     flux_R = 0.5*u(i)**2
                 else if ((u(i)<0.0) .AND. (u(i+1)>0.0)) then
                     flux_R = 0.0
                 else if ((u(i+1) <= 0.0)) then
                     flux_R = 0.5*u(i+1)**2
                 endif
             endif

             u_buf(i) = u(i) - dt_new/dx *(flux_R - flux_L)
         enddo

         call bc_outflow(N,u_buf)
         t = t+dt_new
         write(20,*) t, (u_buf(j), j = 1,N+4)
         
         u = u_buf
         
       END DO
      close(20)

    end subroutine FOG_updater

end module FOG


