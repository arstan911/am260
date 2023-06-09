module eigensystem

#include "definition.h"
  
  use grid_data

contains

  subroutine eigenvalues(V,lambda)
    implicit none

    real, dimension(NUMB_VAR), intent(IN)  :: V
    real, dimension(NUMB_WAVE),intent(OUT) :: lambda

    real :: a, u

    ! sound speed
    a = sqrt(V(GAMC_VAR)*V(PRES_VAR)/V(DENS_VAR))!;print*,a,V(GAMC_VAR),V(PRES_VAR),V(DENS_VAR)
    u = V(VELX_VAR)
    
    lambda(SHOCKLEFT) = u - a
    lambda(CTENTROPY) = u
    lambda(SHOCKRGHT) = u + a
    
    return
  end subroutine eigenvalues


  
  subroutine right_eigenvectors(V,conservative,reig)
    implicit none
    real, dimension(NUMB_VAR), intent(IN)  :: V
    logical :: conservative
    real, dimension(NSYS_VAR,NUMB_WAVE), intent(OUT) :: reig

    real :: a, u, d, g, ekin, hdai, hda
    
    ! sound speed, and others
    a = sqrt(V(GAMC_VAR)*V(PRES_VAR)/V(DENS_VAR))
    u = V(VELX_VAR)
    d = V(DENS_VAR)
    g = V(GAMC_VAR) - 1.
    ekin = 0.5*u**2
    hdai = 0.5*d/a
    hda  = 0.5*d*a
    
    if (conservative) then
       !! Conservative eigenvector
       reig(DENS_VAR,SHOCKLEFT) = 1.
       reig(VELX_VAR,SHOCKLEFT) = u - a
       reig(PRES_VAR,SHOCKLEFT) = ekin + a**2/g - a*u
       reig(:,SHOCKLEFT) = -hdai*reig(:,SHOCKLEFT)

       reig(DENS_VAR,CTENTROPY) = 1.0
       reig(VELX_VAR,CTENTROPY) = u
       reig(PRES_VAR,CTENTROPY) = ekin
       
       reig(DENS_VAR,SHOCKRGHT) = 1.0
       reig(VELX_VAR,SHOCKRGHT) = u + a
       reig(PRES_VAR,SHOCKRGHT) = ekin + a**2/g + a*u
       reig(:,SHOCKRGHT) = hdai*reig(:,SHOCKRGHT)
       
    else
       !! Primitive eigenvector
       reig(DENS_VAR,SHOCKLEFT) = 1.
       reig(VELX_VAR,SHOCKLEFT) = -0.5/hdai
       reig(PRES_VAR,SHOCKLEFT) = 1.
       reig(:,SHOCKLEFT) = -hdai*reig(:,SHOCKLEFT)

       reig(DENS_VAR,CTENTROPY) = 1.0
       reig(VELX_VAR,CTENTROPY) = 0.0
       reig(PRES_VAR,CTENTROPY) = 0.0
       
       reig(DENS_VAR,SHOCKRGHT) = 1.
       reig(VELX_VAR,SHOCKRGHT) = 0.5/hdai
       reig(PRES_VAR,SHOCKRGHT) = 1.0
       reig(:,SHOCKRGHT) = hdai*reig(:,SHOCKRGHT)
      
     
    endif
    
    return
  end subroutine right_eigenvectors


  subroutine left_eigenvectors(V,conservative,leig)
    implicit none
    real, dimension(NUMB_VAR), intent(IN)  :: V
    logical :: conservative
    real, dimension(NSYS_VAR,NUMB_WAVE), intent(OUT) :: leig

    real :: a, u, d, g, ekin, hdai, hda
    
    ! sound speed, and others
    a = sqrt(V(GAMC_VAR)*V(PRES_VAR)/V(DENS_VAR))
    u = V(VELX_VAR)
    d = V(DENS_VAR)
    g = V(GAMC_VAR) - 1.
    ekin = 0.5*u**2
    hdai = 0.5*d/a
    hda  = 0.5*d*a
    
    if (conservative) then
       !! Conservative eigenvector
       leig(DENS_VAR,SHOCKLEFT) = -ekin - a*u/g
       leig(VELX_VAR,SHOCKLEFT) = u + a/(g)
       leig(PRES_VAR,SHOCKLEFT) = -1.0


       leig(DENS_VAR,CTENTROPY) = 2*hdai*(-ekin + a**2/g)
       leig(VELX_VAR,CTENTROPY) = 2*hdai*u
       leig(PRES_VAR,CTENTROPY) = -2*hdai
       
       leig(DENS_VAR,SHOCKRGHT) = ekin - a*u/g
       leig(VELX_VAR,SHOCKRGHT) = -u + a/g
       leig(PRES_VAR,SHOCKRGHT) = 1
      
       leig(:,:) =(g/(2*hda))*leig(:,:)
       
      
       
    else
       !! Primitive eigenvector
       leig(DENS_VAR,SHOCKLEFT) = 0.0
       leig(VELX_VAR,SHOCKLEFT) = 1.0
       leig(PRES_VAR,SHOCKLEFT) = -1.0/(2*hda)
      

       leig(DENS_VAR,CTENTROPY) = 1.0
       leig(VELX_VAR,CTENTROPY) = 0.0
       leig(PRES_VAR,CTENTROPY) = -1.0/(a**2)
       
       leig(DENS_VAR,SHOCKRGHT) = 0.0
       leig(VELX_VAR,SHOCKRGHT) = 1.0
       leig(PRES_VAR,SHOCKRGHT) = 1.0/(2*hda)
      
       
    endif
    
    return
  end subroutine left_eigenvectors


  
end module eigensystem
