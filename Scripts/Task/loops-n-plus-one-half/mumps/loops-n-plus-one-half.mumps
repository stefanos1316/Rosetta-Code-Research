LOOPHALF
 NEW I
 FOR I=1:1:10 DO
 .WRITE I
 .IF I'=10 WRITE ", "
 QUIT
 ;Alternate
 NEW I FOR I=1:1:10 WRITE I WRITE:I'=10 ", "
 KILL I QUIT
