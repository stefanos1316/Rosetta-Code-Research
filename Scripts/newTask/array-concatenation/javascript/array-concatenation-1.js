var a = [1,2,3,4,5],
    b = [6,7,8,9,10],
    c = a.concat(b); //=> [1,2,3,4,5,6]
var arrayLength = c.length;
	for ( var i = 0; i < 1000000; i++) {
		for (var j = 0; j < arrayLength; j++) {
			console.log(c[j]);
		}
}
