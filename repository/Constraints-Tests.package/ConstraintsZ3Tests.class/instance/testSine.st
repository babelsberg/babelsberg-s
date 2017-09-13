testing
testSine

	| ex ex2 solver |
	ex := ExampleClass new.
	ex2 := ExampleClass new.
	solver := ConstraintSolver newZ3Solver.

	self shouldnt: [[ex a sin = 1] alwaysSolveWith: solver] raise: Error.
	self should: [ex a sin clApprox: 1].
	self should: [ex a clApprox: Float halfPi].

	self shouldnt: [[ex b sin = 0] alwaysSolveWith: solver] raise: Error.
	self should: [ex b sin clApprox: 0].

	self shouldnt: [[(ex2 a + ex2 b) sin = 0] alwaysSolveWith: solver] raise: Error.
	self should: [(ex2 a + ex2 b) sin clApprox: 0].