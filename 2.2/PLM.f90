module PLM
use utility
use cfl 
use upwind
implicit none

contains
    subroutine PLM_updater(BCs,lim,Ca,dx,t0,tf,N,u)
     use utility
     use cfl
     use bc
     use upwind
     use downwind
     use centered
     use vanLeers
     use minmod
     use mc

     implicit none

     real(dp), dimension(:), allocatable :: u
     real(dp), intent(in) :: t0,tf,Ca,dx
     real(dp), dimension(:),allocatable :: u_buf
     integer, intent(in) :: N, lim, BCs
     real(dp) :: dt_new, t, flux_R, flux_L, sl, sr, deltaL, deltaC, deltaR
     integer :: i,j
     character(len=80):: file_id, file_name
     
     allocate(u_buf(N+4))
     u_buf = u
     t = t0

     !!! Writing outputs
     write(file_id, '(i0)') lim
     file_name = 'output_PLM_limiter_' // trim(adjustl(file_id)) // '.dat'
     open(20, file = trim(file_name))
     write(20,*) t, (u_buf(j), j = 1,N+4)
     !!! loop for time stepping
     DO WHILE (t <= tf)
         u_buf = u
         call cfl_update(N,Ca,dx,u_buf,dt_new)
         !!! loop for grid 
         do i = 3,N+2
             !!! Limiter depending on choice
             if (lim==1) then
                 call upwind_limiter(dx, u(i-2),u(i-1), deltaL)
                 call upwind_limiter(dx, u(i-1),u(i), deltaC)
                 call upwind_limiter(dx, u(i), u(i+1), deltaR)
             endif
             if (lim==2) then
                 call downwind_limiter(dx, u(i-1),u(i), deltaL)
                 call downwind_limiter(dx, u(i),u(i+1), deltaC)
                 call downwind_limiter(dx, u(i+1), u(i+2), deltaR)
             endif
             if (lim==3) then
                 call centered_limiter(dx, u(i-2),u(i), deltaL)
                 call centered_limiter(dx, u(i-1),u(i+1), deltaC)
                 call centered_limiter(dx, u(i), u(i+2), deltaR)
             endif
             if (lim==4) then
                 call minmod_limiter(dx, u(i-2),u(i-1), u(i),deltaL)
                 call minmod_limiter(dx, u(i-1),u(i),u(i+1), deltaC)
                 call minmod_limiter(dx, u(i),u(i+1),u(i+2), deltaR)
             endif
             if (lim==5) then
                 call mc_limiter(dx, u(i-2),u(i-1), u(i),deltaL)
                 call mc_limiter(dx, u(i-1),u(i),u(i+1), deltaC)
                 call mc_limiter(dx, u(i),u(i+1),u(i+2), deltaR)
             endif
             if (lim==6) then
                 call vanleers_limiter(dx, u(i-2),u(i-1), u(i),deltaL)
                 call vanleers_limiter(dx, u(i-1),u(i),u(i+1), deltaC)
                 call vanleers_limiter(dx, u(i),u(i+1),u(i+2), deltaR)
             endif



              
             !!! conditions for shocks fluxes
             !!! LEFT
             sl = 0.5*(u(i)+u(i-1))
             if (u(i-1) >= u(i)) then
                 if (sl >= 0.0) then
                     flux_L = 0.5*(u(i-1) + 0.5 * dx * deltaL*(1 - sr*dt_new/dx))**2
                 else if (sl < 0.0) then
                     flux_L = 0.5*(u(i) - 0.5 * dx * deltaC*(1 + sr*dt_new/dx))**2
                 endif
             else
                 if (u(i-1)>= 0.0) then
                     flux_L = 0.5*(u(i-1) + 0.5 * dx * deltaL*(1 - sr*dt_new/dx))**2
                 else if ((u(i-1)<0.0) .AND. (u(i)>0.0)) then
                     flux_L = 0.0
                 else if ((u(i) <= 0.0)) then
                     flux_L = 0.5*(u(i) - 0.5 * dx * deltaC*(1 + sr*dt_new/dx))**2
                 endif
             endif

             !!! RIGHT
             sr = 0.5*(u(i)+u(i+1))

             if (u(i) >= u(i+1)) then
                 if (sr >= 0.0) then
                     flux_R = 0.5*(u(i) + 0.5 * dx * deltaC*(1 - sr*dt_new/dx))**2
                 else if (sr < 0.0) then
                     flux_R = 0.5*(u(i+1) - 0.5 * dx * deltaR*(1 + sr*dt_new/dx))**2
                 endif
             else
                 if (u(i)>= 0.0) then
                     flux_R = 0.5*(u(i) + 0.5 * dx * deltaC*(1 - sr*dt_new/dx))**2
                 else if ((u(i)<0.0) .AND. (u(i+1)>0.0)) then
                     flux_R = 0.0
                 else if ((u(i+1) <= 0.0)) then
                     flux_R = 0.5*(u(i+1) - 0.5 * dx * deltaR*(1 + sr*dt_new/dx))**2
                 endif
             endif


             !!! update

             u_buf(i) = u(i) - dt_new/dx *(flux_R - flux_L)

         enddo

     !!! apply BCs
         if (BCs == 1) then
            call bc_outflow(N,u_buf)
         else 
            call bc_periodic(N,u_buf)
         endif
         t = t+dt_new
         write(20,*) t, (u_buf(j), j = 1,N+4)
         u = u_buf

     END DO

     close(20)

    end subroutine PLM_updater

end module PLM