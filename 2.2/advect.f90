program advect

use utility
use setup_module
use grid_init
use advect_init
use IC_setup
use bc
use advect_update
use cfl


implicit none 

integer ::iters, i
real(dp)::dt, dx , dt_new
real(dp), dimension(:), allocatable :: x,t,u0


call setup_init()

print*, 'CFL number is', Ca
print*, 'number of grid points is: ', grid_points
print*, 'method:', methodType
print*, 'Limiter:', limiter 
print*, 'initial time:',t0
print*, 'final time:',tf
print*, 'x left:',x_a
print*, 'x right:',x_b
print*, 'IC', IC
print*, 'BC', BCs

call grid_setup(x_a, x_b, grid_points, t0, tf, iters, Ca, dx, dt, x ,t)
call advect_init_IC_BC(x, grid_points, IC, BCs, u0)
call advect_update_sr(methodType,BCs,limiter,Ca, dx, grid_points,t0,tf,u0)



end program advect