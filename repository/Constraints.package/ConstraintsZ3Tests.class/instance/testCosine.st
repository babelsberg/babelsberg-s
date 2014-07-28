testing
testCosine

	| ex ex2 solver |
	ex := ExampleClass new.
	ex2 := ExampleClass new.
	solver := ConstraintSolver newZ3Solver.

	self shouldnt: [[ex a cos = 0] alwaysSolveWith: solver] raise: Error.
	self should: [ex a cos clApprox: 0].

	self shouldnt: [[ex b cos = 1] alwaysSolveWith: solver] raise: Error.
	self should: [ex b cos clApprox: 1].

	self shouldnt: [[(ex2 a + ex2 b) cos = 1] alwaysSolveWith: solver] raise: Error.
	self should: [(ex2 a + ex2 b) cos clApprox: 1].