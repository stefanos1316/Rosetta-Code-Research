var str = "this is a matching string"; 

for (var i = 0; i < 10000000; ++i) {
    var res = str.match(/string/g);
    var newSubject = str.replace("string", "istyfied");
}