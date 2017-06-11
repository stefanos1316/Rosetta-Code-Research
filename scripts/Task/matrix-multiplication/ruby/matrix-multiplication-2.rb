def matrix_mult(a, b)
  a.map do |ar|
    b.transpose.map do |bc|
      ar.zip(bc).map(&:*).inject(&:+)
    end
  end
end
