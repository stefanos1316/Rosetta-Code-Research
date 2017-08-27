class MyClass:

   def __init__(self,  variable):
      self.variable = variable
   
   def displayMyClass(self):
      print " Variable value is ", self.variable

for i in range(1000000):
	obj = MyClass( 2000)
	obj.displayMyClass()
