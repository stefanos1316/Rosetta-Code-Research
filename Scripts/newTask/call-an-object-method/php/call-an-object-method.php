<?php

class CallAnObjectMethod {
	public static $classVar;
    	function __construct() {
    	}
   
	function someMethod($a) {
        	self::$classVar = $a;
    	}
}

	$myObj = new CallAnObjectMethod();
	for ( $i = 0; $i < 1000000000; $i++) {
		$myObj->someMethod(1);
	}
?>
