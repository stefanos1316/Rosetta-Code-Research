let array1 = [1,2,3,4,5]
let array2 = [6,7,8,9,10]

for i in 1...1000000 {
	let array3 = array1 + array2
	for elements in array3 {
		print(elements)
	}
}
