#!/usr.bin/php 

<?php
for ( $i = 0; $i < 1000000; $i++) {
$s = 'http://foo/bar/';
$s = rawurlencode($s);
echo "$s\n";
}
?>
