: pow ( n m -- n^m )
( written in Retro Forth )
1 2rot
[
  dup 1 and 0 <>
  [ [ tuck * swap ] dip ] ifTrue
  [ dup * ] dip
  1 >>
  dup 0 <>
] while
drop drop ;
