testing
testPriorityChange

	| ex constraint |
	ex := ExampleClass new.
	constraint := [ex a = 42] alwaysTrue.

	self should: [constraint priority = ConstraintPriority required].
	self should: [ex a: 21] raise: ConstraintUnsatisfiableError.

	self shouldnt: [constraint priority: ConstraintPriority medium] raise: Error.
	self should: [constraint priority = ConstraintPriority medium].
	self shouldnt: [ex a: 21] raise: Error.
	