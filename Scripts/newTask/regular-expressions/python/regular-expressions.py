import re

string = "This is a matching string"

for i in range(10000000):
    re.search('string$', string)
    string = re.sub("string", "istyfied", string)
