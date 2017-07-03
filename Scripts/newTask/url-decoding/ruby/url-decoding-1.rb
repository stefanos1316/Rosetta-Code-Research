for i in 0..1000000
require 'cgi'
puts CGI.unescape("http%3A%2F%2Ffoo%20bar%2F")
end
