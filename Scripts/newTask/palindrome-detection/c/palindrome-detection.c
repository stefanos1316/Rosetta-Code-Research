#include <string.h>

int palindrome(const char*);

int main() {

	for (int i=0; i<1000000000; ++i) {
	char* array = "saippuakivikauppias";
	int j = palindrome(array);
	}
	return 0;
}

int palindrome(const char *s)
{
   int i,l;
   l = strlen(s);
   for(i=0; i<l/2; i++)
   {
     if ( s[i] != s[l-i-1] ) return 0;
   }
   return 1;
}
