module setup

  implicit none 
  integer, parameter:: dp = kind(0.d0)
  integer :: i, j
  real (dp), save :: x0, xf, t0, tf, dx, dt, C
 

contains

  subroutine grid_init(x,t,dx,dt,N,C,tN,x0,xf,t0,tf)
    integer, intent(in) :: N,tN
    real(dp), intent(in):: x0,xf,t0,tf
    real(dp), dimension(:), allocatable, intent(out):: x,t
    real(dp), intent(out) :: dx , dt, C

    !! use to set up the grid

    allocate(x(N+4), t(tN))
    x= 0.0
    t=0.0
    dx = (xf-x0) / N
    dt = (tf - t0) / tN

    x(1) = x0 - 1.5 * dx    
    x(2) = x0 - 0.5 * dx
    x(N+3) = xf + 0.5 * dx 
    x(N+4) = xf + 1.5 * dx

    do i =3,N+2
       x(i) = x0 + (i-.5)*dx
    end do

    do i = 1,tN
       t(i) =i *dt
    end do

    C = 0.9
  end subroutine grid_init




  subroutine ex1_ic(u0, uN,u ,x , N ,tN)
    real (dp), dimension(:), intent(in) :: x
    real (dp), dimension(:),allocatable, intent(out) :: u0, uN
    real (dp), dimension(:,:),allocatable, intent(out) :: u
    integer :: N ,tN
    
    allocate(u0(size(x)), uN(size(x)), u(tN,size(x))) 
            u0 = 2.0  
            do i = 1, N 
                if (x(i) > 0.5) then 
                    u0(i) = -1.0 
                end if
            end do
            uN = 0.0              
            u  = 0
            
    end subroutine ex1_ic



  subroutine FOG(u0,uN,u,C,N,tN)  
    real (dp), dimension(:), intent(inout) :: u0, uN
    real (dp), dimension(:,:), intent(out) :: u
    real (dp), intent(in) :: C
    integer :: N , tN 
            do j = 1, tN
                do i = 2, N + 4
                    uN(i) = u0(i) - 0.5 * C * (u0(i) ** 2 - u0(i-1) ** 2)
                end do
                u0 = uN           ! updating interior points 
                u0(1) = u0(3)     ! outflow boundary condition
                u0(2) = u0(3)     ! outflow boundary condition
                u0(N+3) = u0(N+2) ! outflow boundary condition
                u0(N+4) = u0(N+2) ! ouflow boundary condition
                u(j,:) = u0       ! save time series solution
            end do
       end subroutine FOG

          


          






end module setup



  
