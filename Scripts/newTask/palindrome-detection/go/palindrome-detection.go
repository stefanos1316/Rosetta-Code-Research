package main

func main() {

for i := 0; i < 1000000000; i++ {
	var flag bool
	flag = isPalindrome("saippuakivikauppias")
	_ = flag
}
}

func isPalindrome(s string) bool {
	runes := []rune(s)
	for len(runes) > 1 {
		if runes[0] != runes[len(runes)-1] {
			return false
		}
		runes = runes[1 : len(runes)-1]
	}
	return true
}
