testing
testConjunctionError

	| ex solver |
	ex := ExampleClass new.
	ex a: 1.
	ex b: 1.
	solver := ConstraintSolver newZ3Solver.

	self shouldnt: [[ex a = 3] alwaysSolveWith: solver] raise: Error.
	self should: [ex a = 3].
	self should: [ex b = 1].

	self should: [[(ex b = 2) & (ex a = 2)] alwaysSolveWith: solver] raise: ConstraintUnsatisfiableError.
	self should: [ex a = 3].
	self should: [ex b = 1].