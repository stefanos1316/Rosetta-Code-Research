#include <iostream>

using namespace std;
 
template <typename T1, typename T2>
int* concatArrays( T1& array_1, T2& array_2) {
  int arrayCount_1 = sizeof(array_1) / sizeof(array_1[0]);
  int arrayCount_2 = sizeof(array_2) / sizeof(array_2[0]);
  int newArraySize = arrayCount_1 + arrayCount_2;
 
  int *p = new int[newArraySize];
 
  for (int i = 0; i < arrayCount_1; i++) {
  	p[i] = array_1[i];
  }
 
  for (int i = arrayCount_1; i < newArraySize; i++) {
	int newIndex = i-arrayCount_2;
	p[i] = array_2[--newIndex];
  }
 
  return p;
}
 
int main() {
  int ary[5] = {1, 2, 3, 4, 5};
  int anotherAry[5] = {6, 7, 8, 9, 10};
 
  for ( int j=0; j < 1000000; ++j) {

  int *r = concatArrays(ary, anotherAry);
 
  for ( int i = 0; i < 10; ++i) {
  	cout << *(r + i) << endl;
  }
 
  delete r;
  }

  return 0;
}
