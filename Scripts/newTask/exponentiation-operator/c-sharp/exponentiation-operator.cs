using System;

class exponentiationOperator {

static void Main(string[] args)
{

for (int i = 0; i < 1000000000; ++i ) {
	Expon(2017, 12);
	Expon(19.88, 12);
}
}
 
static double Expon(int Val, int Pow) 
{
	return Math.Pow(Val, Pow);
}
static double Expon(double Val, int Pow)
{
	return Math.Pow(Val, Pow);
}
}
