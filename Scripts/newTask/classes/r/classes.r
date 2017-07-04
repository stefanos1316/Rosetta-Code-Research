
for(i in 0:1000000) {

myClassVariable <- list(Variable="193578")
class(myClassVariable) <- append(class(myClassVariable), "Value")

GetVariable <- function(x) {
	UseMethod("GetVariable",x)
}

GetVariable.Value <-function(x) {
	return(x$Variable)
}

print(paste("Variable value is ",GetVariable(myClassVariable)))
}

