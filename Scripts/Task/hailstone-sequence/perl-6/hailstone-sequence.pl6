sub hailstone($n) { $n, { $_ %% 2 ?? $_ div 2 !! $_ * 3 + 1 } ... 1 }

my @h = hailstone(27);
say "Length of hailstone(27) = {+@h}";
say ~@h;

my $m = max (+hailstone($_) => $_ for 1..99_999);
say "Max length {$m.key} was found for hailstone({$m.value}) for numbers < 100_000";
