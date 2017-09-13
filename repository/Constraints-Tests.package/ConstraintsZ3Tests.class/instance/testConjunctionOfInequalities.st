testing
testConjunctionOfInequalities

	| ex solver |
	ex := ExampleClass new.
	ex a: 0; b: 17.
	solver := ConstraintSolver newZ3Solver.

	self shouldnt: [[ex a >= 1 & (ex a <= 9)] alwaysSolveWith: solver] raise: Error.
	self shouldnt: [[ex b >= 1 & (ex b <= 9)] alwaysSolveWith: solver] raise: Error.

	self should: [ex a >= 1 & (ex a <= 9)].
	self should: [ex b >= 1 & (ex b <= 9)].