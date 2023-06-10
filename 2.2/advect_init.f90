!!! This module SETS UP the INITIAL CONDITIONS for advection including a call to a proper Boundacry conditions and CFL

module advect_init
use utility 
use IC_setup
use bc

implicit none


contains
 subroutine advect_init_IC_BC(x,N,IC,BCs,u0)
     use utility
     use IC_setup

     implicit none 
     integer, intent(in) :: IC, BCs,N
     real(dp), dimension(:),allocatable, intent(in) :: x
     real(dp), dimension(:), allocatable,intent(out):: u0

     allocate(u0(N+4))
     u0 = 0.0
     if (IC == 1) then 
         call ic_setup_1_738(x,u0)
         endif
     if (IC == 2) then 
         call ic_setup_2_739(x,u0)
         endif
     if (IC == 3) then 
         call ic_setup_3_740(x,u0)
         endif
     if (IC == 4) then 
         call ic_setup_4_741(x,u0)
         endif
     if (IC == 5) then 
         call ic_setup_5_742(x,u0)
         endif
     if (IC == 6) then 
         call ic_setup_6_743(x,u0)
         endif
     if (IC == 7) then 
         call ic_setup_7_744(x,u0)
         endif
     if (IC == 8) then 
         call ic_setup_8_745(x,u0)
         endif
     if (IC == 9) then 
         call ic_setup_9_746(x,u0)
         endif
     if (IC == 10) then 
         call ic_setup_10_747(x,u0)
         endif
     if (IC == 11) then 
         call ic_setup_11_748(x,u0)
         endif


     if (BCs == 1) then
         call bc_outflow(N,u0)
     else
         call bc_periodic(N,u0)
     endif


 end subroutine advect_init_IC_BC

end module advect_init