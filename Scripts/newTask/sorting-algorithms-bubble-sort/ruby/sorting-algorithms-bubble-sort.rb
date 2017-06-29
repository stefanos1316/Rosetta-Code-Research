class Array
  def bubblesort1!
    length.times do |j|
      for i in 1...(length - j)
        if self[i] < self[i - 1]
          self[i], self[i - 1] = self[i - 1], self[i]
        end
      end
    end
    self
  end
   def bubblesort2!
    each_index do |index|
      (length - 1).downto( index ) do |i|
        self[i-1], self[i] = self[i], self[i-1] if self[i-1] < self[i]
      end
    end
    self
  end
end

for i in 0..1000000
ary = [16,93,-99,95,-96,-24,-53,-71,96,-66,-21,72,-12,-32,-96,62,-42,-50,49,53,-65,52,-25,-69,88,-43,60,66,-94,-69,53,-71,-17,-58,-30,32,-16,-94,-42,-86,59,-53,94,97,-12,15,65,-35,-12,-82,-82,48,-48,66,-42,-63,33,-49,41,-85,94,66,-60,60,-65,-73,-50,-9,-48,-3,15,-77,81,95,-93,83,-21,34,-78,-61,-22,-58,65,78,41,-7,-59,20,88,-38,-15,-69,42,97,-35,61,8,2,-22,-85]
ary.bubblesort1!
# p ary
# => [3, 4, 6, 6, 8, 23, 78]
end
