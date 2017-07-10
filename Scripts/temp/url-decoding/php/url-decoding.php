#!/usr/bin/php
<?php

for ( $i = 0; $i < 1000000; $i++) {
$encoded = "http%3A%2F%2Ffoo%20bar%2F";
$unencoded = rawurldecode($encoded);
echo "$unencoded !\n";
}

?>
