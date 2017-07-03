using System;
namespace FactorialExample
{
    class Program
    {
        static void Main(string[] args)
        {
		long fact;
		for (int i = 0; i < 1000000; ++i)
            		fact = GetFactorial(1000);
        }
 
        private static long GetFactorial(int number)
        {          
            if (number == 0)
            {
                return 1;
            }
            return number * GetFactorial(number-1);
        }
    }
}
