.say for '1', *.subst(/(.)$0*/, { .chars ~ .[0] }, :g) ... *;
