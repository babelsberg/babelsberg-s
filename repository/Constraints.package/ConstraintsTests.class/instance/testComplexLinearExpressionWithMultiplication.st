testing
testComplexLinearExpressionWithMultiplication

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

	self shouldnt: [[(ex a - ex2 b) * 3 = (ex2 a * 2 + (ex b - ex3 a * (-4)))] alwaysTrue] raise: Error.
	self should: [(ex a - ex2 b) * 3 clApprox: (ex2 a * 2 + (ex b - ex3 a * (-4)))].

	self shouldnt: [ex a: 1] raise: Error.
	self should: [(ex a - ex2 b) * 3 clApprox: (ex2 a * 2 + (ex b - ex3 a * (-4)))].
	self should: [ex a clApprox: 1].

	self shouldnt: [ex2 b: 2] raise: Error.
	self should: [(ex a - ex2 b) * 3 clApprox: (ex2 a * 2 + (ex b - ex3 a * (-4)))].
	self should: [ex2 b clApprox: 2].

	self shouldnt: [ex2 a: 4] raise: Error.
	self should: [(ex a - ex2 b) * 3 clApprox: (ex2 a * 2 + (ex b - ex3 a * (-4)))].
	self should: [ex2 a clApprox: 4].

	self shouldnt: [ex b: 5] raise: Error.
	self should: [(ex a - ex2 b) * 3 clApprox: (ex2 a * 2 + (ex b - ex3 a * (-4)))].
	self should: [ex b clApprox: 5].

	self shouldnt: [ex3 a: 6] raise: Error.
	self should: [(ex a - ex2 b) * 3 clApprox: (ex2 a * 2 + (ex b - ex3 a * (-4)))].
	self should: [ex3 a clApprox: 6].