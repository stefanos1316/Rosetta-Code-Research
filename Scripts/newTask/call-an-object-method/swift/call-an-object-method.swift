class CallAnObjectMethod{

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
  func someMethod(a: Int) {
    self.variable = a
  }
}

let value = CallAnObjectMethod()
for i in 0...1000000000 {
	value.someMethod(a: 1)
}
