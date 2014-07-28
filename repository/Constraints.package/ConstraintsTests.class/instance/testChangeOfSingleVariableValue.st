testing
testChangeOfSingleVariableValue

	| ex |
	ex := ExampleClass new.
	self shouldnt: [[ex a = 42] alwaysTrue.] raise: Error.
	self should: [ex a = 42].

	self should: [ex a: 23] raise: ConstraintUnsatisfiableError.
	self should: [ex a = 42].