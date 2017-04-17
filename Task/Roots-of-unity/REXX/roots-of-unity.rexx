/*REXX program computes the  K  roots of  unity  (which usually includes complex roots).*/
parse arg n frac .                               /*get optional arguments from the C.L. */
if   n=='' |    n==","  then     n=1             /*Not specified?  Then use the default.*/
if frac='' | frac==","  then  frac=5             /* "      "         "   "   "     "    */
start=abs(n)                                     /*assume only one  K  is wanted.       */
if n<0                  then start=1             /*Negative?  Then use a range of  K's. */
numeric digits length(pi()) - 1                  /*use number of decimal digits in  pi. */
pi2=pi*2                                         /*obtain the value of   pi  doubled.   */
                                                 /*display unity roots for a range,  or */
  do k=start  to abs(n)                          /*                   just for one  K.  */
  say right(k 'roots of unity', 40, "─")         /*display a pretty separator with title*/
      do angle=0  by pi2/k  for k                /*compute the angle for each root.     */
      rp=adjust(cos(angle))                      /*compute real part via  COS  function.*/
      if left(rp,1)\=='-'  then rp=" "rp         /*not negative?  Then pad with a blank.*/
      ip=adjust(sin(angle))                      /*compute imaginary part via SIN funct.*/
      if left(ip,1)\=='-'  then ip="+"ip         /*Not negative?  Then pad with  + char.*/
      if ip=0  then say rp                       /*Only real part? Ignore imaginary part*/
               else say left(rp,frac+4)ip'i'     /*display the real and imaginary part. */
      end  /*angle*/
  end      /*k*/
exit                                             /*stick a fork in it,  we're all done. */
/*──────────────────────────────────────────────────────────────────────────────────────*/
adjust: parse arg x; near0='1e-' || (digits()-digits()%10)      /*compute a tiny number.*/
        if abs(x)<near0  then x=0                /*if it's near zero,  then assume zero.*/
        return format(x,,frac)/1                 /*fraction digits past decimal point.  */
/*──────────────────────────────────────────────────────────────────────────────────────*/
pi:  pi=3.141592653589793238462643383279502884197169399375105820974944592307816; return pi
/*──────────────────────────────────────────────────────────────────────────────────────*/
r2r: return arg(1) // (pi()*2)                   /*reduce #radians: -2pi──� +2pi radians*/
/*──────────────────────────────────────────────────────────────────────────────────────*/
cos: procedure; parse arg x;     x=r2r(x);   a=abs(x);     numeric fuzz min(9, digits()-9)
     if a=pi/3  then return .5;  if a=pi/2|a=pi*2  then return 0
     if a=pi    then return -1;  if a=pi*2/3       then return -.5; return .sincos(1,1,-1)
/*──────────────────────────────────────────────────────────────────────────────────────*/
sin: procedure; parse arg x;     x=r2r(x);         numeric fuzz min(5,digits()-3)
     if abs(x)=pi  then return 0;                                   return .sincos(x,x, 1)
/*──────────────────────────────────────────────────────────────────────────────────────*/
.sincos: parse arg z,_,i;       x=x*x;                   p=z
                   do k=2  by 2;  _=-_*x/(k*(k+i));  z=z+_;  if z=p  then leave;  p=z; end
         return z
