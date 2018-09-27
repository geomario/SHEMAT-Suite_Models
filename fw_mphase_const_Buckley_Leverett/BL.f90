program BL
IMPLICIT NONE
INTEGER, parameter ::  dp=selected_real_kind(12)
REAL(kind=dp) ::  x, se
REAL(kind=dp) ::  q, A, t, dfs, eps=1.E-8
REAL(kind=dp) ::  lambda = 2.
REAL(kind=dp) ::  phi
INTEGER  :: i, N=1000

open(unit=1, status="unknown", file="bl.dat")
A=16.
q=16.E-5
t=86400.
phi=.2
se=1.
DO i=1,N
  se=se-1./N
  dfs=(fw(se+eps, lambda) - fw(se-eps, lambda))&
       /  (2.*eps)
  IF  (ABS( fw(se, lambda )/dfs)-se>1.E-8) THEN
    x = (q*t )/(A*phi )*dfs
  END IF
  IF (x>0.)  write(unit=1,fmt=*) x, se
END DO
contains

REAL(kind=dp) FUNCTION fw(s, lambda)
REAL(kind=dp) :: lambda,  s
     fw = mw(s, lambda)/(mw(s, lambda) + mn(s , lambda ))
END FUNCTION
REAL(kind=dp)  FUNCTION mw(s, lambda)
REAL(kind=dp) :: lambda, s
mw = s**((2 + 3*lambda )/ lambda )
END FUNCTION
REAL(kind=dp)  FUNCTION mn(s, lambda)
REAL(kind=dp)  :: lambda,  s
  mn = (1-s )*(1-s)*(1-s**((2+lambda )/lambda))
END FUNCTION
end program BL
