#!/usr/bin/perl -w
use strict ;

sub expon {
   my ( $base , $expo ) = @_ ;
   if ( $expo == 0 ) {
      return 1 ;
   }
   elsif ( $expo == 1 ) {
      return $base ;
   }
   elsif ( $expo > 1 ) {
      my $prod = 1 ;
      foreach my $n ( 0..($expo - 1) ) {
	 $prod *= $base ;
      }
      return $prod ;
   }
   elsif ( $expo < 0 ) {
      return 1 / ( expon ( $base , -$expo ) ) ;
   }
}

for ( $a=0; $a < 1000000000; $a = $a + 1) {
	expon( 2017 , 12 );
	expon( 19.88 , 12 );
}
