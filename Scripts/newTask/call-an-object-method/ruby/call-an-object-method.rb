class CallAnObjectMethod

  def setVariable (a)
    @instance_var = @a
  end

end

my_class = CallAnObjectMethod.new 
for i in 0..1000000000
	my_class.setVariable(1)
end
