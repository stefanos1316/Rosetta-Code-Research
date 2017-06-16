/*REXX program generates and displays  all  permutations  of    N    different objects. */
parse arg things bunch inbetweenChars names

                       /* inbetweenChars  (optional)   defaults to a  [null].           */
                       /*          names  (optional)   defaults to digits (and letters).*/

call permSets things, bunch, inbetweenChars, names
exit                                             /*stick a fork in it,  we're all done. */
/*──────────────────────────────────────────────────────────────────────────────────────*/
p:  return word(arg(1),1)                        /*P  function (Pick first arg of many).*/
/*──────────────────────────────────────────────────────────────────────────────────────*/
permSets: procedure; parse arg x,y,between,uSyms /*X    things taken    Y    at a time. */
          @.=;   sep=                            /*X  can't be  >  length(@0abcs).      */
          @abc  = 'abcdefghijklmnopqrstuvwxyz';     @abcU=@abc;         upper @abcU
          @abcS = @abcU || @abc;                    @0abcS=123456789 || @abcS

            do k=1  for x                        /*build a list of permutation symbols. */
            _=p(word(uSyms,k)  p(substr(@0abcS,k,1) k))      /*get or generate a symbol.*/
            if length(_)\==1  then sep='_'       /*if not 1st character,  then use sep. */
            $.k=_                                /*append the character to symbol list. */
            end   /*k*/

          if between==''  then between=sep       /*use the appropriate separator chars. */
          call .permset 1                        /*start with the  first  permuation.   */
          return
.permset: procedure expose $. @. between x y;     parse arg ?
          if ?>y then do; _=@.1;   do j=2  to y;  _=_ || between || @.j; end;  say _;  end
                 else do q=1  for x              /*build the permutation recursively.   */
                          do k=1  for ?-1;  if @.k==$.q  then iterate q;  end  /*k*/
                      @.?=$.q;              call .permset ?+1
                      end    /*q*/
          return
