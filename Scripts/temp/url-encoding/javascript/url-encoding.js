for ( var i = 0; i < 1000000; i++) { 
var normal = 'http://foo/bar/';
var encoded = encodeURIComponent(normal);
console.log(encoded);
}
