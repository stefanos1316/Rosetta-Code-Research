function isPalindrome(str) {
  return str === str.split("").reverse().join("");
}

for ( var i = 0; i < 1000000000; ++i)
var a = isPalindrome("saippuakivikauppias");
