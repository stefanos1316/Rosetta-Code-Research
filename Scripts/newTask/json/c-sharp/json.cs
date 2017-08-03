using System;
using System.Collections.Generic;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

//using System.Web.Script.Serialization;
//using System.Runtime.Serialization.Json;



class Program
{
    static void Main()
    {
	
	for ( int i =0; i < 10000000; i++) {
	        var people = new Dictionary<string, object> {{"foo", "1"}, {"bar", "10"}};
	  	
		string output = JsonConvert.SerializeObject(people);
	}
    }
}
