class Hofstadter {
  has @!c = 1,1;
  method AT-POS ($me: Int $i) {
    @!c.push($me[@!c.elems-$me[@!c.elems-1]] +
	     $me[@!c.elems-$me[@!c.elems-2]]) until @!c[$i]:exists;
    return @!c[$i];
  }
}
