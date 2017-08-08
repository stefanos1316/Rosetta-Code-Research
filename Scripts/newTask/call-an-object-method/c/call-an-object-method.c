#include <stdlib.h>

typedef struct sMyClass
{
  int variable;
} *MyClass;

MyClass  MyClass_new()
{
  MyClass pthis = malloc(sizeof *pthis);
  pthis->variable = 0;
  return pthis;
}


void MyClass_someMethod(MyClass pthis)
{
  int value = pthis->variable;
}

int main() {

	MyClass obj = MyClass_new();
	for (int i = 0; i < 1000000000; ++i) {
		MyClass_someMethod(obj);
	}

return 0;
}
