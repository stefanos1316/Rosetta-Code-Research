

// Static
//MyClass::method(someParameter);

// Instance
//myInstance.method(someParameter);


#include <iostream>

using namespace std;

class someMethod {
		int setNumber;
	public:	
		void setValue(int );
};

void someMethod::setValue (int value) {
	setNumber = value;
}


int main () {

	someMethod  objectCall;

	for (int i = 0; i < 1000000000; ++i)
		objectCall.setValue(100);

	return 0;
}
