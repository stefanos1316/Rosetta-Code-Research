<?php

class MyClass {
    public static $classVar;
    public $instanceVar; // can also initialize it here
    function __construct($value) {
        $this->instanceVar = $value;
    }
    function someMethod() {
        self::$classVar = 3;
	echo "Variable value is $this->instanceVar\n";
    }
}

for ( $i = 0; $i < 1000000; $i++) {
	$myObj = new MyClass(1974);
	$myObj->someMethod();
}
?>
