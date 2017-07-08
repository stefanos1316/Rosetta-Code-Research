
fn main() {
    struct MyClass {
	variable: u32
  }

    impl MyClass {
        pub fn new() -> MyClass {
            MyClass { variable: 19022 }
        }
        pub fn someMethod(&self) -> u32 {
            return self.variable
        }
    }

for i in 0..1000000{
    let my_class = MyClass::new();
    println!("Variable value is {}", my_class.someMethod());
}
}
