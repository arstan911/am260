program advect
use utility
use setup_module
implicit none 




call setup_init()

print*, 'CFL number is', Ca
print*, 'number of grid points is: ', grid_points
print*, 'method:', methodType
print*, 'initial time:',t0
print*, 'final time:',tf
print*, 'x left:',x_a
print*, 'x right:',x_b




end program advect