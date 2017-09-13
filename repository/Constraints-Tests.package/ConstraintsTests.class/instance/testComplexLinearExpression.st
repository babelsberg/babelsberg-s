testing
testComplexLinearExpression

	| ex ex2 ex3 |
	ex := ExampleClass new.
	ex a: 23.
	ex b: 24.
	ex2 := ExampleClass new.
	ex2 a: 17.
	ex2 b: 18.
	ex3 := ExampleClass new.
	ex3 a: 41.
	ex3 b: 42.

	self shouldnt: [[(ex a - ex2 b) + ex3 a = (ex2 a - (ex b + ex3 b))] alwaysTrue] raise: Error.
	self should: [(ex a - ex2 b) + ex3 a = (ex2 a - (ex b + ex3 b))].

	self shouldnt: [ex a: 1] raise: Error.
	self should: [(ex a - ex2 b) + ex3 a = (ex2 a - (ex b + ex3 b))].
	self should: [ex a = 1].

	self shouldnt: [ex2 b: 2] raise: Error.
	self should: [(ex a - ex2 b) + ex3 a = (ex2 a - (ex b + ex3 b))].
	self should: [ex2 b = 2].

	self shouldnt: [ex3 a: 3] raise: Error.
	self should: [(ex a - ex2 b) + ex3 a = (ex2 a - (ex b + ex3 b))].
	self should: [ex3 a = 3].

	self shouldnt: [ex2 a: 4] raise: Error.
	self should: [(ex a - ex2 b) + ex3 a = (ex2 a - (ex b + ex3 b))].
	self should: [ex2 a = 4].

	self shouldnt: [ex b: 5] raise: Error.
	self should: [(ex a - ex2 b) + ex3 a = (ex2 a - (ex b + ex3 b))].
	self should: [ex b = 5].

	self shouldnt: [ex3 b: 6] raise: Error.
	self should: [(ex a - ex2 b) + ex3 a = (ex2 a - (ex b + ex3 b))].
	self should: [ex3 b = 6].