!!! This module SETS UP the INITIAL CONDITIONS for advection 
module IC_setup
use utility 
implicit none


contains

   !!! here are 11 IC that we use 
   subroutine ic_setup_1_738(x,u0)
     use utility
     implicit none
     real(dp), dimension(:), allocatable, intent(in) :: x
     real(dp), dimension(:), allocatable, intent(inout) :: u0
     integer :: i

     u0 = 2.0
     do i = 1,size(x)
         if (x(i)>0.5) then
             u0(i) = -1.0
         endif
     enddo
   end subroutine ic_setup_1_738


   subroutine ic_setup_2_739(x,u0)
     use utility
     implicit none
     real(dp), dimension(:), allocatable, intent(in) :: x
     real(dp), dimension(:), allocatable, intent(inout) :: u0
     integer :: i

     u0 = 1.0
     do i = 1,size(x)
         if (x(i)>0.5) then
             u0(i) = -1.0
         endif
     enddo
   end subroutine ic_setup_2_739


   subroutine ic_setup_3_740(x,u0)
     use utility
     implicit none
     real(dp), dimension(:), allocatable, intent(in) :: x
     real(dp), dimension(:), allocatable, intent(inout) :: u0
     integer :: i

     u0 = 1.0
     do i = 1,size(x)
         if (x(i)>0.5) then
             u0(i) = -2.0
         else 
             u0(i) = 1.0    
         endif
     enddo


   end subroutine ic_setup_3_740

   subroutine ic_setup_4_741(x,u0)
     use utility
     implicit none
     real(dp), dimension(:), allocatable, intent(in) :: x
     real(dp), dimension(:), allocatable, intent(inout) :: u0
     integer :: i

     
     u0 = -1.0
     do i = 1,size(x)
         if (x(i)>0.5) then
             u0(i) = 1.0
         endif
     enddo
   end subroutine ic_setup_4_741



   subroutine ic_setup_5_742(x,u0)
     use utility
     implicit none
     real(dp), dimension(:), allocatable, intent(in) :: x
     real(dp), dimension(:), allocatable, intent(inout) :: u0
     integer :: i

     do i = 1,size(x)
        u0(i) = sin(2.0*pi*x(i))
     enddo
   end subroutine ic_setup_5_742



   subroutine ic_setup_6_743(x,u0)
     use utility
     implicit none
     real(dp), dimension(:), allocatable, intent(in) :: x
     real(dp), dimension(:), allocatable, intent(inout) :: u0
     integer :: i
     do i = 1,size(x)
         if ( x(i)>=0.0 .and. x(i)<=0.3 ) then
             u0(i) = 2.0
         endif

         if ( x(i)>0.3 .and. x(i)<=0.6 ) then
             u0(i) = -1.0
         endif

         if ( x(i)>0.6 .and. x(i)<=1.0 ) then
             u0(i) = 3.0
         endif   
     enddo
   end subroutine ic_setup_6_743



    subroutine ic_setup_7_744(x,u0)
     use utility
     implicit none
     real(dp), dimension(:), allocatable, intent(in) :: x
     real(dp), dimension(:), allocatable, intent(inout) :: u0
     integer :: i
     do i = 1,size(x)
         if ( x(i)>=0.0 .and. x(i)<=0.3 ) then
             u0(i) = -1.0
         endif

         if ( x(i)>0.3 .and. x(i)<=0.6 ) then
             u0(i) = 2.0
         endif

         if ( x(i)>0.6 .and. x(i)<=1.0 ) then
             u0(i) = -2.0
         endif   
     enddo
   end subroutine ic_setup_7_744



    subroutine ic_setup_8_745(x,u0)
     use utility
     implicit none
     real(dp), dimension(:), allocatable, intent(in) :: x
     real(dp), dimension(:), allocatable, intent(inout) :: u0
     integer :: i
     do i = 1,size(x)
         if ( x(i)>=0.0 .and. x(i)<=0.3 ) then
             u0(i) = 4.0
         endif

         if ( x(i)>0.3 .and. x(i)<=0.6 ) then
             u0(i) = 2.0
         endif

         if ( x(i)>0.6 .and. x(i)<=1.0 ) then
             u0(i) = -1.0
         endif   
     enddo
   end subroutine ic_setup_8_745



    subroutine ic_setup_9_746(x,u0)
     use utility
     implicit none
     real(dp), dimension(:), allocatable, intent(in) :: x
     real(dp), dimension(:), allocatable, intent(inout) :: u0
     integer :: i
     do i = 1,size(x)
         if ( x(i)>=0.0 .and. x(i)<=0.3 ) then
             u0(i) = 4.0
         endif

         if ( x(i)>0.3 .and. x(i)<=0.6 ) then
             u0(i) = 0.0
         endif

         if ( x(i)>0.6 .and. x(i)<=1.0 ) then
             u0(i) = -6.0
         endif   
     enddo
   end subroutine ic_setup_9_746



    subroutine ic_setup_10_747(x,u0)
     use utility
     implicit none
     real(dp), dimension(:), allocatable, intent(in) :: x
     real(dp), dimension(:), allocatable, intent(inout) :: u0
     integer :: i
     do i = 1,size(x)
         if ( x(i)>=0.0 .and. x(i)<=0.3 ) then
             u0(i) = 4.0
         endif

         if ( x(i)>0.3 .and. x(i)<=0.6 ) then
             u0(i) = 0.0
         endif

         if ( x(i)>0.6 .and. x(i)<=1.0 ) then
             u0(i) = -4.0
         endif   
     enddo
   end subroutine ic_setup_10_747



    subroutine ic_setup_11_748(x,u0)
     use utility
     implicit none
     real(dp), dimension(:), allocatable, intent(in) :: x
     real(dp), dimension(:), allocatable, intent(inout) :: u0
     integer :: i
     do i = 1,size(x)
        u0(i) = sin(2.0*pi*x(i))
     enddo
   end subroutine ic_setup_11_748


end module IC_setup