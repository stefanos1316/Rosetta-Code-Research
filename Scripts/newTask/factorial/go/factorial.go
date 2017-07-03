package main


func factorial(x uint) uint {
	if x == 0 {
		return 1
	}
	
	return x * factorial(x-1)
}

func main() {
 	for i := 0; i < 1000000; i++ {
	x := uint(1000)
	factorial(x)
	}
}
