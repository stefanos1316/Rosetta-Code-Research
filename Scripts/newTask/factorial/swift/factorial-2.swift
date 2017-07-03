func factorial(_ num: Int) -> Int {

    return num < 1 ? 1 : num * factorial(num - 1)
}

for i in 0...1000000 {
	let number = 1000
	factorial(number)
}
