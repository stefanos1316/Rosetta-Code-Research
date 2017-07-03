#include <iostream>

int factorial(int);

int main() {
for (int i = 0; i < 1000000; ++i) {	
	int j = factorial(1000);
}
	return 0; 	
}

int factorial(int number) {
	int temp;

	if(number <= 1) return 1;

	temp = number * factorial(number - 1);
	return temp;
}

