program advect

use utility
use setup_module
use grid_init
implicit none 

integer ::iters, i
real(dp)::dt, dx 
real(dp), dimension(:), allocatable :: x,t


call setup_init()

print*, 'CFL number is', Ca
print*, 'number of grid points is: ', grid_points
print*, 'method:', methodType
print*, 'initial time:',t0
print*, 'final time:',tf
print*, 'x left:',x_a
print*, 'x right:',x_b


call grid_setup(x_a,x_b,grid_points ,t0,tf,iters,Ca,dx,dt,x,t)
print*, 'number of iterations:', iters
print*,'dx: ',dx
print*, 'dt', dt
print*, 'x grid points:'
do i=1,grid_points+4
 print*, x(i)
enddo






end program advect