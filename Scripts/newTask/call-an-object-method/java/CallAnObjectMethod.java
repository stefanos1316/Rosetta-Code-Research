public class CallAnObjectMethod {

  private int variable; 
  public CallAnObjectMethod(){
  }

  public void someMethod(int value){
   this.variable = value;
  }

public static void main(String[] args){

	CallAnObjectMethod obj = new CallAnObjectMethod();
	for (int i = 0; i < 1000000000; ++i) {
		obj.someMethod(1);
	}
}

}
