module setup_module

!#include "definition.h"

  use read_initFile_module

  implicit none

  real(kind=8), save :: Ca, t0, tf, x_a, x_b
  integer, save :: grid_points,  IC, BC
  character(len=80), save :: methodType

contains

  subroutine setup_init()

    implicit none

    call read_initFileChar('advect.init','method', methodType)
    call read_initFileReal('advect.init', 'CFL', Ca)
    call read_initFileInt('advect.init', 'grid_points', grid_points)
    call read_initFileInt('advect.init', 'IC', IC)
    call read_initFileInt('advect.init', 'BC', BC)
    call read_initFileReal('advect.init','initial_time', t0)
    call read_initFileReal('advect.init','final_time', tf)
    call read_initFileReal('advect.init','x_a', x_a)
    call read_initFileReal('advect.init','x_b', x_b)

  end subroutine setup_init
  

end module setup_module