var a = [1,2,3,4,5],
    b = [6,7,8,9,10],
    c = a.concat(b); //=> [1,2,3,4,5,6]
var arrayLength = c.length;
	for ( var i = 0; i < 10000000; i++) {
	c = a.concat(b);
}
