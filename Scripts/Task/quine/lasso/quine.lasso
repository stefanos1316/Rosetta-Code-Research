var(a=(:10,39,118,97,114,40,97,61,40,58,39,10,36,97,45,62,106,111,105,110,40,39,44,39,41,10,39,41,41,39,10,118,97,114,40,98,61,98,121,116,101,115,41,10,36,97,45,62,102,111,114,101,97,99,104,32,61,62,32,123,32,36,98,45,62,105,109,112,111,114,116,56,98,105,116,115,40,35,49,41,32,125,10,36,98,45,62,97,115,83,116,114,105,110,103))
'var(a=(:'
$a->join(',')
'))'
var(b=bytes)
$a->foreach => { $b->import8bits(#1) }
$b->asString
