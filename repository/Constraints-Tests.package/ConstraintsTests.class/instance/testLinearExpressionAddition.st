testing
testLinearExpressionAddition

	| ex ex2 |
	ex := ExampleClass new.
	ex a: 23.
	ex2 := ExampleClass new.
	ex2 a: 17.

	self shouldnt: [[ex a + ex2 a = 42] alwaysTrue] raise: Error.
	self should: [ex a + ex2 a = 42].

	self shouldnt: [ex a: 13] raise: Error.
	self should: [ex a + ex2 a = 42].
	self should: [ex a = 13].

	self shouldnt: [ex2 a: 17] raise: Error.
	self should: [ex a + ex2 a = 42].
	self should: [ex2 a = 17].