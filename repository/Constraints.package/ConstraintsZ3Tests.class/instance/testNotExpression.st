testing
testNotExpression

	| ex solver |
	ex := ExampleClass new.
	ex a: 5.
	ex b: 3.
	solver := ConstraintSolver newZ3Solver.

	self shouldnt: [[(ex a = ex b) not] alwaysSolveWith: solver] raise: Error.
	self shouldnt: [ex a = ex b].