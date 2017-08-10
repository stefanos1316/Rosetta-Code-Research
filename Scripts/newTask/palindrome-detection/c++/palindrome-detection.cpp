#include <string>
#include <algorithm>

bool is_palindrome(std::string);

int main() {

	for (int i=0; i<1000000000; ++i) {
	std::string array = "saippuakivikauppias";
	bool j = is_palindrome(array);
	}
	return 0;
}


bool is_palindrome(std::string s)
{
  return std::equal(s.begin(), s.end(), s.rbegin());
}
