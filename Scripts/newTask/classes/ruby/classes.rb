class MyClass

  def initialize
    @instance_var = 67712
  end

  def printVariable
    puts "Variable value is #{@instance_var}."
  end

end

for i in 0..1000000

my_class = MyClass.new #allocates an object and calls it's initialize method, then returns it.
my_class.printVariable

end
