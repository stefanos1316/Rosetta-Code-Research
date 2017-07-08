package main


func main() {
    // Example 1:  Idiomatic in Go is use of the append function.
    // Elements must be of identical type.
    
	for i := 0; i < 10000000; i++ {
   		a := []int{1, 2, 3, 4 ,5}
    		b := []int{6, 7, 8, 9, 10} // these are technically slices, not arrays
		c := append(a, b...)
		_ = c
	}

}
