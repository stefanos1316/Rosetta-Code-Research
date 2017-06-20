/*REXX program  finds  the  common directory path  for a list of files.                 */
         @.  =                                   /*the default for all file lists (null)*/
         @.1 = '/home/user1/tmp/coverage/test'
         @.2 = '/home/user1/tmp/covert/operator'
         @.3 = '/home/user1/tmp/coven/members'
L=length(@.1)                                    /*use the length of the first string.  */
                do j=2  while  @.j\==''          /*start search with the second string. */
                _=compare(@.j, @.1)              /*use REXX  compare  BIF for comparison*/
                if _==0  then iterate            /*Strings are equal? Then they're equal*/
                L=min(L, _)                      /*find the minimum length equal strings*/
                end   /*j*/

common=left( @.1, lastpos('/', @.1,L) )          /*determine the shortest  DIR  string. */
if right(common, 1)=='/'  then common=left(common, max(0, length(common) - 1) )
say 'common directory path: '  common            /* [↑]  handle trailing   /   delimiter*/
                                                 /*stick a fork in it,  we're all done. */
