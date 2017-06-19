my @arr1 = (1, 2, 3, 4, 5);
my @arr2 = (6, 7, 8, 9, 10);

for( $a=0; $a < 1000000; $a = $a + 1) {
push @arr1, @arr2;
print "@arr1\n";
}
