sub rref (@m) {
    @m or return;
    my ($lead, $rows, $cols) = 0, +@m, +@m[0];

    for ^$rows -> $r {
        return @m if $lead >= $cols;
        my $i = $r;

        until @m[$i][$lead] {
            ++$i == $rows or next;
            $i = $r;
            ++$lead == $cols and return @m;
        }

        @m[$i, $r] = @m[$r, $i];

        my $lv = @m[$r][$lead];
        @m[$r] »/=» $lv;

        for ^$rows -> $n {
            next if $n == $r;
            @m[$n] »-=» @m[$r] »*» @m[$n][$lead];
        }
        ++$lead;
    }
    @m
}

sub rat-or-int ($num) {
    return $num unless $num ~~ Rat;
    return $num.narrow if $num.narrow.WHAT ~~ Int;
    $num.nude.join: '/';
}

sub say_it ($message, @array) {
    say "\n$message";
    $_».&rat-or-int.fmt(" %5s").say for @array;
}

my @M = (
    [ # base test case
      [  1,  2,  -1,  -4 ],
      [  2,  3,  -1, -11 ],
      [ -2,  0,  -3,  22 ],
    ],
    [ # mix of number styles
      [  3,   0,  -3,    1 ],
      [ .5, 3/2,  -3,   -2 ],
      [ .2, 4/5,  -1.6, .3 ],
    ],
    [ # degenerate case
      [ 1,  2,  3,  4,  3,  1],
      [ 2,  4,  6,  2,  6,  2],
      [ 3,  6, 18,  9,  9, -6],
      [ 4,  8, 12, 10, 12,  4],
      [ 5, 10, 24, 11, 15, -4],
    ],
    [ # larger matrix
      [1,  0,  0,  0,  0,  0,  1,  0,  0,  0,  0, -1,  0,  0,  0,  0,  0,  0],
      [1,  0,  0,  0,  0,  0,  0,  1,  0,  0,  0,  0, -1,  0,  0,  0,  0,  0],
      [1,  0,  0,  0,  0,  0,  0,  0,  1,  0,  0,  0,  0, -1,  0,  0,  0,  0],
      [0,  1,  0,  0,  0,  0,  1,  0,  0,  0,  0,  0,  0,  0, -1,  0,  0,  0],
      [0,  1,  0,  0,  0,  0,  0,  0,  1,  0,  0, -1,  0,  0,  0,  0,  0,  0],
      [0,  1,  0,  0,  0,  0,  0,  0,  0,  0,  1,  0,  0,  0,  0,  0, -1,  0],
      [0,  0,  1,  0,  0,  0,  1,  0,  0,  0,  0,  0, -1,  0,  0,  0,  0,  0],
      [0,  0,  1,  0,  0,  0,  0,  0,  0,  1,  0,  0,  0,  0, -1,  0,  0,  0],
      [0,  0,  0,  1,  0,  0,  0,  1,  0,  0,  0,  0,  0,  0,  0, -1,  0,  0],
      [0,  0,  0,  1,  0,  0,  0,  0,  0,  1,  0,  0, -1,  0,  0,  0,  0,  0],
      [0,  0,  0,  0,  1,  0,  0,  1,  0,  0,  0,  0,  0, -1,  0,  0,  0,  0],
      [0,  0,  0,  0,  1,  0,  0,  0,  1,  0,  0,  0,  0,  0,  0,  0, -1,  0],
      [0,  0,  0,  0,  1,  0,  0,  0,  0,  0,  1,  0,  0,  0,  0, -1,  0,  0],
      [0,  0,  0,  0,  0,  1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0],
      [0,  0,  0,  0,  0,  0,  0,  0,  0,  1,  0,  0,  0,  0,  0,  0,  0,  0],
      [0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  1,  0,  1],
      [0,  0,  0,  0,  0,  1,  0,  0,  0,  0,  1,  0,  0,  0, -1,  0,  0,  0],
   ]
);

for @M -> @matrix {
    say_it( 'Original Matrix', @matrix );
    say_it( 'Reduced Row Echelon Form Matrix', rref(@matrix) );
    say "\n";
}
