<?php
function factorial($n) {
  if ($n < 0) {
    return 0;
  }

  if ($n == 0) {
    return 1;
  }

  else {
    return $n * factorial($n-1);
  }
}

for ( $i = 0; $i < 1000000; $i++) {
 factorial(1000);
}

?>
