  !! Main program to run Hw4
program advection
 use setup 
 implicit none 
 real(dp), dimension(:), allocatable, save :: x , t, u0, uN
 real(dp), dimension(:,:), allocatable, save :: u
 integer :: N , tN, k, l

 !! Change for different examples
 N =32
 tN = 22
 x0 = 0.0
 xf = 1.0
 t0 = 0.0
 tf = 0.3

!!!!!!!!!!!!!!!

 call grid_init(x,t,dx,dt,N,C,tN,x0,xf,t0,tf)

 call ex1_ic(u0,uN,u,x,N,tN)
 
 call FOG(u0,uN,u,C,N,tN)


 open(20, file = "output.dat", status = "replace")
                do i = 1, tN
                    write(20,*) t(i), (u(i,j), j = 1, N)
                end do
 close(20)

 



 


 






















  
end program advection

