ISPRIME(N)
 QUIT:(N=2) 1
 NEW I,R
 SET R=N#2
 IF R FOR I=3:2:(N**.5) SET R=N#I Q:'R
 KILL I
 QUIT R
