class MyClass{
	constructor(variable) {
		this.variable = variable;
	}

	someMethod() {
		console.log(this.variable);
	}
}

for (var i = 0; i < 1000000; ++i) {
	const obj = new MyClass(123456);
	obj.someMethod();
}
