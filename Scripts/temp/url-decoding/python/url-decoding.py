import urllib

for i in range(10000000):
	print urllib.unquote("http%3A%2F%2Ffoo%20bar%2F")
