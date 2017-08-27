str = "this is a matching tring"
for i in 0..10000000
    if str =~ /string$/
    end
    str.sub(/string/, 'istyfied') 
end

