var num = 100;

//recursive
var factorial = function(n) {
    if(n == 0) {
        return 1
    } else {
        return n * factorial(n - 1);
    }
}
 
for (var i = 0; i < 1000000; ++i) { 
factorial(num);
}
