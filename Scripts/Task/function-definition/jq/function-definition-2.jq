# 2 | generate(. * .) will generate 2, 4, 16, 256, ...
def generate(f): def r: ., (f | r); r;
