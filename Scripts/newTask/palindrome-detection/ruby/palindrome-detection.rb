def palindrome?(s)
  s == s.reverse
end

for i in 0..1000000000
	palindrome?("saippuakivikauppias")
end
