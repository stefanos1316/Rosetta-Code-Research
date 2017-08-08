class CallAnObjectMethod {
	constructor() {
	}

	someMethod(a) {
		var value = a;
	}
}

const obj = new CallAnObjectMethod();

for (var i = 0; i < 1000000000; ++i) {
	obj.someMethod(1);
}
