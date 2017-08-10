<?php
function is_palindrome($string) {
  return $string == strrev($string);
}

for ( $i = 0; $i < 1000000000; ++$i ) {
$result = is_palindrome("saippuakivikauppias");
}
?>
