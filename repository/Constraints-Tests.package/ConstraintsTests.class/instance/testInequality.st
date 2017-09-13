testing
testInequality

	| ex |
	ex := ExampleClass new.
	ex a: 15.
	ex b: 15.

	self shouldnt: [[ex a <= 10] alwaysTrue] raise: Error.
	self should: [ex a <= 10].
	self should: [ex a = 10].

	self shouldnt: [ex a: 7] raise: Error.
	self should: [ex a = 7].

	self should: [ex a: 17] raise: ConstraintUnsatisfiableError.
	self should: [ex a = 7].

	self shouldnt: [[ex b >= 20] alwaysTrue] raise: Error.
	self should: [ex b >= 20].
	self should: [ex b = 20].

	self shouldnt: [ex b: 27] raise: Error.
	self should: [ex b = 27].

	self should: [ex b: 17] raise: ConstraintUnsatisfiableError.
	self should: [ex b = 27].