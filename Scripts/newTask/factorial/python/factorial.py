def factorial(n):
    z=1
    if n>1:
        z=n*factorial(n-1)
    return z

for i in range(10000000):
	result = factorial(5);

