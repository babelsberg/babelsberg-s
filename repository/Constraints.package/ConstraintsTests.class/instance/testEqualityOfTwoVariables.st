testing
testEqualityOfTwoVariables

	| ex ex2 |
	ex := ExampleClass new.
	ex a: 23.
	ex2 := ExampleClass new.
	ex2 a: 17.

	self shouldnt: [[ex a = ex2 a] alwaysTrue] raise: Error.
	self should: [ex a = ex2 a].

	self shouldnt: [ex2 a: 42] raise: Error.
	self should: [ex a = ex2 a].
	self should: [ex2 a = 42].

	self shouldnt: [ex a: 9] raise: Error.
	self should: [ex a = ex2 a].
	self should: [ex a = 9].

	self shouldnt: [ex2 a: 21] raise: Error.
	self should: [ex a = ex2 a].
	self should: [ex2 a = 21].