module FOG
use utility
use cfl 

implicit none 

contains 
   subroutine FOG_updater(Ca,u0,)
     use utility
     use cfl
     use bc

     implicit none 
     real(dp), dimension(:), allocatable, intent(in) :: u0


   end subroutine FOG_updater

end module FOG


