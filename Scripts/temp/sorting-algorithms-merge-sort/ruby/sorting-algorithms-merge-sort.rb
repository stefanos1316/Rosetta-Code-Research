def merge_sort(m)
  return m if m.length <= 1

  middle = m.length / 2
  left = merge_sort(m[0...middle])
  right = merge_sort(m[middle..-1])
  merge(left, right)
end

def merge(left, right)
  result = []
  until left.empty? || right.empty?
    result << (left.first<=right.first ? left.shift : right.shift)
  end
  result + left + right
end

for i in 0..1000000
	ary = [16,93,-99,95,-96,-24,-53,-71,96,-66,-21,72,-12,-32,-96,62,-42,-50,49,53,-65,52,-25,-69,88,-43,60,66,-94,-69,53,-71,-17,-58,-30,32,-16,-94,-42,-86,59,-53,94,97,-12,15,65,-35,-12,-82,-82,48,-48,66,-42,-63,33,-49,41,-85,94,66,-60,60,-65,-73,-50,-9,-48,-3,15,-77,81,95,-93,83,-21,34,-78,-61,-22,-58,65,78,41,-7,-59,20,88,-38,-15,-69,42,97,-35,61,8,2,-22,-85]
	merge_sort(ary)                
end
