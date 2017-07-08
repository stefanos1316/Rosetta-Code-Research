package main

import "fmt"

// a basic "class."
// In quotes because Go does not use that term or have that exact concept.
// Go simply has types that can have methods.
type MyGoClass struct {
    variable  int // "instance variables"
}

// a method (yes, Go uses the word method!)
func  someMethod(b *MyGoClass) int {
	return b.variable
}


func main(){
    
for i := 0; i < 1000000; i++ {
	obj := &MyGoClass{variable: 1000}
	fmt.Println(someMethod(obj))
}
}
