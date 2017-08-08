// Static
//MyClass.Method(someParameter);
 
// Instance
//myInstance.Method(someParameter);

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
  public void someMethod(int value){
   this.variable = value;
  }

public static void Main(String[] args){

	MyClass obj = new MyClass();
	for (int i = 0; i < 1000000000; ++i) {
		obj.someMethod(1);
	}
}

}
