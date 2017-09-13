testing
testZ3Stay

	| ex solver |
	ex := ExampleClass new.
	ex a: 3.
	solver := ConstraintSolver newZ3Solver.

	self should: [ex a = 3].
	self shouldnt: [[ex a stay] alwaysSolveWith: solver] raise: Error.
	self should: [ex a = 3].

	self should: [ex a: 21] raise: ConstraintUnsatisfiableError.