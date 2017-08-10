using System;
 
class Program
{
    static string Reverse(string value)
    {
        char[] chars = value.ToCharArray();
        Array.Reverse(chars);
        return new string(chars);
    }
 
    static bool IsPalindrome(string value)
    {
        return value == Reverse(value);
    }
 
    static void Main(string[] args)
    {
	bool j = false;
	for (int i = 0; i < 1000000000; ++i)
	       j = IsPalindrome("saippuakivikauppias");
    }
}
