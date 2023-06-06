!!! This module SETS UP the GRID configuration

module grid_init
use utility 
implicit none


contains 
 subroutine grid_setup(x_a,x_b,N,t0,tf,iters,Ca,dx,dt,x,t)
    use utility
    implicit none
    integer, intent(inout) :: N, iters
    real(dp), intent(in):: x_a, x_b, t0, tf, Ca
    real(dp), intent(out) :: dt, dx 
    real(dp), dimension(:), allocatable,intent(out) :: x,t
    integer:: i 

    dx = (x_b - x_a)/N
    dt = Ca*dx
    iters = (tf-t0)/dt
    allocate(x(N+4), t(iters))
    x(1) = x_a - 1.5*dx
    x(2) = x_a - 0.5*dx 
    x(N+3) = x_b + 0.5*dx
    x(N+4) = x_b + 1.5*dx 
    do i = 3,N+2
      x(i) = x_a + (i-2.5)*dx
    enddo

    t(1) = t0
    t(iters) = tf
    do i =2,iters-1
      t(i) = t0 + dt*i
    enddo
 

 end subroutine grid_setup






end module grid_init