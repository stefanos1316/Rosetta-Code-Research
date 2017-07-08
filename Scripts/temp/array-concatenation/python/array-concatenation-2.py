arr5 = [1, 2, 3, 4, 5]
arr6 = [6, 7, 8, 9, 10]
arr6 += arr5

for i in range(10000000):
	arr6 = [6, 7, 8, 9, 10]
	arr6 += arr5

