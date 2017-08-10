# Numerical integration

Explanation in this [link](http://rosettacode.org/wiki/Numerical_integration)

**Task**

Write functions to calculate the definite integral of a function     ƒ(x)     using   all   five of the following methods:

  * rectangular
  	* left
  	* right
  	* midpoint
  * trapezium
  * Simpson's

Your functions should take in the upper and lower bounds   (a   and   b),   and the number of approximations to make in that range   (n).

Assume that your example already has a function that gives values for     ƒ(x).

Simpson's method is defined by the following pseudo-code:

		h := (b - a) / n
		sum1 := f(a + h/2)
		sum2 := 0

		loop on i from 1 to (n - 1)
    			sum1 := sum1 + f(a + h * i + h/2)
    			sum2 := sum2 + f(a + h * i)

		answer := (h / 6) * (f(a) + f(b) + 4*sum1 + 2*sum2)

Demonstrate your function by showing the results for:

ƒ(x) = x3,   where     x     is   [0,1],   with 100 approximations.   The exact result is   1/4,   or   0.25.

ƒ(x) = 1/x,   where   x   is   [1,100],   with 1,000 approximations.   The exact result is the natural log of 100,   or about   4.605170

ƒ(x) = x,     where   x   is   [0,5000],   with 5,000,000 approximations.   The exact result is   12,500,000.

ƒ(x) = x,     where   x   is   [0,6000],   with 6,000,000 approximations.   The exact result is   18,000,000.
