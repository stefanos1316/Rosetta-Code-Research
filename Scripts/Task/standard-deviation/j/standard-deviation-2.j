   of     =: @:
   sqrt   =: %:
   sum    =: +/
   squares=: *:
   data   =: ]
   mean   =: sum % #

   stddevP=: sqrt of mean of squares of (data-mean)

   stddevP\ 2 4 4 4 5 5 7 9
0 1 0.942809 0.866025 0.979796 1 1.39971 2
