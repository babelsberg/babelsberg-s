testing
testConjunctionError

	| ex |
	ex := ExampleClass new.
	ex a: 1.
	ex b: 1.

	self shouldnt: [[ex a = 3] alwaysTrue] raise: Error.
	self should: [ex a = 3].
	self should: [ex b = 1].

	self should: [[(ex b = 2) & (ex a = 2)] alwaysTrue] raise: ConstraintUnsatisfiableError.
	self should: [ex a = 3].
	self should: [ex b = 1].