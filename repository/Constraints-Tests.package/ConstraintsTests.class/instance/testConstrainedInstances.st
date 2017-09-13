testing
testConstrainedInstances

	| ex ex2 |
	ex := ExampleClass new.
	ex a: 17.
	ex2 := ExampleClass new.
	ex2 a: 23.

	self shouldnt: [[ex a = 42] alwaysTrue.] raise: Error.
	self should: [ex a = 42].
	self should: [ex2 a = 23].

	self should: [ex a: 3] raise: ConstraintUnsatisfiableError.
	self shouldnt: [ex2 a: 3] raise: Error.