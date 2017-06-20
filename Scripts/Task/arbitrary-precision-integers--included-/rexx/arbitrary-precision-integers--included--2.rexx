/*REXX program calculates and demonstrates  arbitrary precision numbers.      */
numeric digits 5 + 1                   /*6  is needed  (not 5)  for  ooRexx.  */

                  n=5** (4** (3** 2))  /*calculate multiple exponentiations.  */

parse var n 'E' pow .                  /*POW   might be null,  so   N  is OK. */

if pow\==''  then do                   /*general case:   POW  might be < zero.*/
                  numeric digits abs(pow)+9    /*recalculate with more digits.*/
                  n=5** (4** (3** 2))  /*calculate multiple exponentiations.  */
                  end

check = 62060698786608744707...92256259918212890625
sampl = left(n, 20)'...'right(n, 20)

say  ' check:'   check
say  'sample:'   sampl
say  'digits:'   length(n)
say
if check==sampl  then say 'passed!'
                 else say 'failed!'
                                       /*stick a fork in it,  we're all done. */
