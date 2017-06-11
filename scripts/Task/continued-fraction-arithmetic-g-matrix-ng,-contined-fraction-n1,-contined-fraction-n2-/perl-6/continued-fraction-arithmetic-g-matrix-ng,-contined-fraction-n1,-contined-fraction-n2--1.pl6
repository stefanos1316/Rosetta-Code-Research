class NG2 {
    has ( $!a12, $!a1, $!a2, $!a, $!b12, $!b1, $!b2, $!b );

    # Public methods
    method operator($!a12, $!a1, $!a2, $!a, $!b12, $!b1, $!b2, $!b ) { self }

    method apply(@cf1, @cf2, :$limit = 30) {
        my @cfs = [@cf1], [@cf2];
        gather {
            while @cfs[0] or @cfs[1] {
                my $term;
                (take $term if $term = self!extract) unless self!needterm;
                my $from = self!from;
                $from = @cfs[$from] ?? $from !! $from +^ 1;
                self!inject($from, @cfs[$from].shift);
            }
            take self!drain while $!b;
        }[ ^$limit ].grep: *.defined;
    }

    # Private methods
    method !inject ($n, $t) {
        multi sub xform(0, $t, $x12, $x1, $x2, $x) { $x2 + $x12 * $t, $x + $x1 * $t, $x12, $x1 }
        multi sub xform(1, $t, $x12, $x1, $x2, $x) { $x1 + $x12 * $t, $x12, $x + $x2 * $t, $x2 }
        ( $!a12, $!a1, $!a2, $!a ) = xform($n, $t, $!a12, $!a1, $!a2, $!a );
        ( $!b12, $!b1, $!b2, $!b ) = xform($n, $t, $!b12, $!b1, $!b2, $!b );
    }
    method !extract {
        my $t = $!a div $!b;
        ( $!a12, $!a1, $!a2, $!a, $!b12, $!b1, $!b2, $!b ) =
          $!b12, $!b1, $!b2, $!b,
                                  $!a12 - $!b12 * $t,
                                         $!a1 - $!b1 * $t,
                                               $!a2 - $!b2 * $t,
                                                     $!a - $!b * $t;
        $t;
    }
    method !from {
        return $!b == $!b2 == 0 ?? 0 !!
           $!b == 0 || $!b2 == 0 ?? 1 !!
           abs($!a1*$!b*$!b2 - $!a*$!b1*$!b2) > abs($!a2*$!b*$!b1 - $!a*$!b1*$!b2) ?? 0 !! 1;
    }
    method !needterm {
        so !([&&] $!b12, $!b1, $!b2, $!b) or $!a/$!b != $!a1/$!b1 != $!a2/$!b2 != $!a12/$!b1;
    }
    method !noterms($which) {
        $which ?? (($!a1, $!a, $!b1, $!b ) = $!a12, $!a2, $!b12, $!b2)
               !! (($!a2, $!a, $!b2, $!b ) = $!a12, $!a1, $!b12, $!b1);
    }
    method !drain {
    self!noterms(self!from) if self!needterm;
    self!extract;
    }
}

sub r2cf(Rat $x is copy) { # Rational to continued fraction
    gather loop {
    $x -= take $x.floor;
    last unless $x;
    $x = 1 / $x;
    }
}

sub cf2r(@a) { # continued fraction to Rational
    my $x = @a[* - 1].FatRat; # Use FatRats for arbitrary precision
    $x = @a[$_- 1] + 1 / $x for reverse 1 ..^ @a;
    $x
}

# format continued fraction for pretty printing
sub ppcf(@cf) { "[{ @cf.join(',').subst(',',';') }]" }

# format Rational for pretty printing. Use FatRats for arbitrary precision
sub pprat($a) { $a.FatRat.denominator == 1 ?? $a !! $a.FatRat.nude.join('/') }

my %ops = ( # convenience hash of NG matrix operators
    '+' => (0,1,1,0,0,0,0,1),
    '-' => (0,1,-1,0,0,0,0,1),
    '*' => (1,0,0,0,0,0,0,1),
    '/' => (0,1,0,0,0,0,1,0)
);

sub test_NG2 ($rat1, $op, $rat2) {
    my @cf1 = $rat1.&r2cf;
    my @cf2 = $rat2.&r2cf;
    my @result = NG2.new.operator(|%ops{$op}).apply( @cf1, @cf2 );
    say "{$rat1.&pprat} $op {$rat2.&pprat} => {@cf1.&ppcf} $op ",
        "{@cf2.&ppcf} = {@result.&ppcf} => {@result.&cf2r.&pprat}\n";
}

# Testing
test_NG2(|$_) for
   [   22/7, '+',  1/2 ],
   [  23/11, '*', 22/7 ],
   [  13/11, '-', 22/7 ],
   [ 484/49, '/', 22/7 ];
