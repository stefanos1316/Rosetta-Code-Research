foreach ( 0 .. 1000000 ) {
   factorial( 1000 );
}

sub factorial
{
   my $number = shift;   # get the argument

   if ( $number <= 1 ) { # base case
      return 1;
   }
   else {                # recursive step
      return $number * factorial( $number - 1 );
   }
}
