testing
testLinearExpressionMultiplication

	| ex ex2 |
	ex := ExampleClass new.
	ex a: 23.
	ex2 := ExampleClass new.
	ex2 a: 17.

	self shouldnt: [[ex a * 3 = 42] alwaysTrue] raise: Error.
	self should: [ex a * 3 = 42].

	self should: [ex a: 13] raise: ConstraintUnsatisfiableError.
	self should: [ex a * 3 = 42].
	self should: [ex a = 14].

	self shouldnt: [ex a: 14] raise: Error.
	self should: [ex a * 3 = 42].