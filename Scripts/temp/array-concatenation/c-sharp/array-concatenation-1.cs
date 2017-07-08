using System;

namespace RosettaCode
{
    class Program
    {
        static void Main(string[] args)
        {
            int[] a = { 1, 2, 3, 4, 5 };
            int[] b = { 6, 7, 8, 9, 10 };

            int[] c = new int[a.Length + b.Length];
            
	    for ( int i =0; i < 10000000; i++) {
	    a.CopyTo(c, 0);
            b.CopyTo(c, a.Length);
	    
	}
        }
    }
}
