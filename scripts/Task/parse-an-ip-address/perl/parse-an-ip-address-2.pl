127.0.0.1
        v4 7f000001     port -1

127.0.0.1:80
        v4 7f000001     port 80

::1
        v6 00000000000000000000000000000001     port -1

[::1]:80
        v6 00000000000000000000000000000001     port 80

2605:2700:0:3::4713:93e3
        v6 260527000000000300000000471393e3     port -1

[2605:2700:0:3::4713:93e3]:80
        v6 260527000000000300000000471393e3     port 80

::ffff:192.168.0.1
        v6 00000000000000000000ffffc0a80001     port -1

[::ffff:192.168.0.1]:22
        v6 00000000000000000000ffffc0a80001     port 22

::ffff:127.0.0.0.1
        parse error
a::b::1
        parse error
