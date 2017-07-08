#!/usr/bin/php
<?php

$arr1 = array(1, 2, 3, 4, 5);
$arr2 = array(6, 7, 8, 9, 10);

for ( $i = 0; $i < 10000000; $i++) {
	$arr3 = array_merge($arr1, $arr2);
}

?>
