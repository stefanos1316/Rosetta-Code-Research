import urllib

for i in range(10000000):
	s = 'http://foo/bar/'
	s = urllib.quote(s)
	print s
