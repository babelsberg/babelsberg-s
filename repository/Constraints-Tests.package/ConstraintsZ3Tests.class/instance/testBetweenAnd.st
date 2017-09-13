testing
testBetweenAnd

	| ex solver |
	ex := ExampleClass new.
	ex a: 15.
	solver := ConstraintSolver newZ3Solver.

	self shouldnt: [[ex a between: 1 and: 9] alwaysSolveWith: solver] raise: Error.
	self should: [ex a >= 1].
	self should: [ex a <= 9].

	self shouldnt: [ex a: 7] raise: Error.
	self should: [ex a = 7].

	self should: [ex a: 17] raise: ConstraintUnsatisfiableError.
	self should: [ex a = 7].