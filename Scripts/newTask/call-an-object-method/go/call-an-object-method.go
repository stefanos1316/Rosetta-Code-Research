package main

// a basic "class."
// In quotes because Go does not use that term or have that exact concept.
// Go simply has types that can have methods.
type MyGoClass struct {
    variable  int // "instance variables"
}

// a method (yes, Go uses the word method!)
func  someMethod(b *MyGoClass) {
	obj_2 :=&MyGoClass{variable: b.variable}
	_ = obj_2
}


func main(){
    
for i := 0; i < 1000000000; i++ {
	obj := &MyGoClass{variable: 1000}
	someMethod(obj)
}
}
