class MyClass{

  // stored property
  var variable : Int

  /**
  * The constructor
  */
  init() {
    self.variable = 42
  }

  /**
  * A method
  */
  func someMethod() {
    self.variable = 123456 
    print("Variable value is ",self.variable)
  }
}

for i in 0...1000000 {
let value = MyClass()
value.someMethod()
}
