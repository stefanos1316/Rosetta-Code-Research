using System;
using System.Text.RegularExpressions;

class Program {
    static void Main(string[] args) {
        string str = "this is a matching string";
    
    for (int i = 0; i < 10000000; ++i) {

        if (new Regex("string$").IsMatch(str)) { 
        }
        str = new Regex("string").Replace(str, "istyfied");
    }
    }
}
