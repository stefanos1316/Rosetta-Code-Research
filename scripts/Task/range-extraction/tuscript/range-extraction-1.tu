$$ MODE TUSCRIPT
MODE DATA
$$ numbers=*
0,  1,  2,  4,  6,  7,  8, 11, 12, 14,
15, 16, 17, 18, 19, 20, 21, 22, 23, 24,
25, 27, 28, 29, 30, 31, 32, 33, 35, 36,
37, 38, 39
$$ MODE TUSCRIPT
numbers=EXCHANGE   (numbers,":,><<> :':")
unrangednrs=JOIN   (numbers,"")
rangednrs=COMBINE  (unrangednrs,"")
rangednrs=EXCHANGE (rangednrs,":':,:")
PRINT rangednrs
