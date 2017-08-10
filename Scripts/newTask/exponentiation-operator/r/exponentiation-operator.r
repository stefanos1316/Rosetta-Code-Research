# Method
pow <- function(x, y)
{
   x <- as.numeric(x)
   y <- as.integer(y)
   prod(rep(x, y))
}
#Operator
"%pow%" <- function(x,y) pow(x,y)


for(i in 0:1000000000) {
pow(2017, 12)    # 81
19.88 %pow% 12  # 6.25
}
