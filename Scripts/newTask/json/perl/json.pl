use JSON;

for( $a=0; $a < 1000000; $a = $a + 1) {

my $data = decode_json('{ "foo": 1, "bar": [10, "apples"] }');

my $sample = { blue => [1,2], ocean => "water" };
my $json_string = encode_json($sample);
}
