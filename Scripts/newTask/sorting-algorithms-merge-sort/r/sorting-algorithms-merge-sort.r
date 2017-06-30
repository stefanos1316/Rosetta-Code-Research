mergesort <- function(m)
{
   merge_ <- function(left, right)
   {
      result <- c()
      while(length(left) > 0 && length(right) > 0)
      {
         if(left[1] <= right[1])
         {
            result <- c(result, left[1])
            left <- left[-1]
         } else
         {
            result <- c(result, right[1])
            right <- right[-1]
         }
      }
      if(length(left) > 0) result <- c(result, left)
      if(length(right) > 0) result <- c(result, right)
      result
   }

   len <- length(m)
   if(len <= 1) m else
   {
      middle <- length(m) / 2
      left <- m[1:floor(middle)]
      right <- m[floor(middle+1):len]
      left <- mergesort(left)
      right <- mergesort(right)
      if(left[length(left)] <= right[1])
      {
         c(left, right)
      } else
      {
         merge_(left, right)
      }
   }
}
for(j in 0:1000000) {
mergesort(c(16,93,-99,95,-96,-24,-53,-71,96,-66,-21,72,-12,-32,-96,62,-42,-50,49,53,-65,52,-25,-69,88,-43,60,66,-94,-69,53,-71,-17,-58,-30,32,-16,-94,-42,-86,59,-53,94,97,-12,15,65,-35,-12,-82,-82,48,-48,66,-42,-63,33,-49,41,-85,94,66,-60,60,-65,-73,-50,-9,-48,-3,15,-77,81,95,-93,83,-21,34,-78,-61,-22,-58,65,78,41,-7,-59,20,88,-38,-15,-69,42,97,-35,61,8,2,-22,-85)) # -31   0   1   2   4  65  83  99 78
}
