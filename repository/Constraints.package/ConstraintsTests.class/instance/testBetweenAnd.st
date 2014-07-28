testing
testBetweenAnd

	| ex |
	ex := ExampleClass new.
	ex a: 15.

	self shouldnt: [[ex a between: 1 and: 9] alwaysTrue] raise: Error.
	self should: [ex a >= 1].
	self should: [ex a <= 9].

	self shouldnt: [ex a: 7] raise: Error.
	self should: [ex a = 7].

	self should: [ex a: 17] raise: ConstraintUnsatisfiableError.
	self should: [ex a = 7].