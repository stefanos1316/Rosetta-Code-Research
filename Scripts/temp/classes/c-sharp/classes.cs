using System;

class MyClass{

  // instance variable
  private int variable;  // Note: instance variables are usually "private"

  /**
  * The constructor
  */
  public MyClass(){
    // creates a new instance
  }

  /**
  * A method
  */
  public void someMethod(){
   this.variable = 1;
    Console.WriteLine("Variable value is "+this.variable);
  }

public static void Main(String[] args){

for (int i = 0; i < 1000000; ++i) {
	MyClass obj = new MyClass();
	obj.someMethod();
}
}

}

