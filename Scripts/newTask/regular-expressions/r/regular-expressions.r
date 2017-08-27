pattern <- "string"
text1 <- "this is a matching string"

for(i in 0:10000000) {
grep(pattern, c(text1))  # 1
gsub(pattern, "istyfied", c(text1))
}