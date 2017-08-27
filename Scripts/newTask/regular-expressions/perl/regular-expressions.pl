$string = "this is a matching string";

for( $a=0; $a < 10000000; $a = $a + 1) {
if ($string =~ /string$/) {
}

$string =~ s/ string/ istyfied/; # makes "I am a string" into "I am another string"
}