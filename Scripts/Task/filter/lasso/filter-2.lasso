local(original = array(1,2,3,4,5,6,7,8,9,10))
with item in #original where #item % 2 != 0 do #original ->removeall(#item)
#original
