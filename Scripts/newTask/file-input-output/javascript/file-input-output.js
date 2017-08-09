
for ( var i = 0; i < 1000000; i++) {
fs = require('fs');
fs.readFile('../input.txt', 'utf8', function (err, data) {
            if (err) throw err;
            //Do your processing, MD5, send a satellite to the moon, etc.
            fs.writeFile ('output.txt', data, function(err) {
                if (err) throw err;
            });
        });
}
