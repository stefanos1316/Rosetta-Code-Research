

<?php
$string = 'this is a matching string';

for ( $i = 0; $i < 10000000; $i++) {
# Test
if (preg_match('/string$/', $string))
{}
# Replace
$string = preg_replace('/\bstring\b/', 'istyfied', $string);
}
?>