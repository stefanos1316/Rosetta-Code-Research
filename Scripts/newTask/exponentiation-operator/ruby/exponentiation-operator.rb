class Numeric
  def pow(m)
    raise TypeError, "exponent must be an integer: #{m}" unless m.is_a? Integer
    Array.new(m, self).reduce(1, :*)
  end
end

  for i in 0..1000000000 
	2017.pow(12)
	19.88.pow(12)
  end

