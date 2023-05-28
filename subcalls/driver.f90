program driver

use utility, only: dp
use subs
implicit none
real(dp):: a, b, sum

a = 5
b = 2.0/3.0

call summation(a,b,sum)
write(*,*) sum

end program