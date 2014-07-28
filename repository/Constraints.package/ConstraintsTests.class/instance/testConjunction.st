testing
testConjunction

	| ex |
	ex := ExampleClass new.

	self shouldnt: [[ex a = 2 & (ex b = 2)] alwaysTrue] raise: Error.
	self should: [ex a = 2].
	self should: [ex b = 2].

	self should: [ex a: 3] raise: ConstraintUnsatisfiableError.
	self should: [ex b: 3] raise: ConstraintUnsatisfiableError.