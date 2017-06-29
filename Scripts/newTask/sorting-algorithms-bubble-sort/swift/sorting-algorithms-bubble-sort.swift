var inputArr = [12,56,32,23,67,87,45,23,10,11]
func swapNumbers(index1 :Int,index2: Int) {
let temp = inputArr[index1]
inputArr[index1] = inputArr[index2]
inputArr[index2] = temp
}
for var index: Int = inputArr.count–1; index > 1; –index {
for var jIndex: Int = 0; jIndex < index; ++jIndex {
if inputArr[jIndex] > inputArr[jIndex + 1] {
swapNumbers(jIndex, jIndex+1)
}
}
}
