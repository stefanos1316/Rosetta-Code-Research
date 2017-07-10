sub urldecode {
    my $s = shift;
    $s =~ tr/\+/ /;
    $s =~ s/\%([A-Fa-f0-9]{2})/pack('C', hex($1))/eg;
    return $s;
}

for( $a=0; $a < 1000000; $a = $a + 1) {
print urldecode('http%3A%2F%2Ffoo+bar%2F')."\n";
}
