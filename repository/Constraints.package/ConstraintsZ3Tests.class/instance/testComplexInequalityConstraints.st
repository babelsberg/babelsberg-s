testing
testComplexInequalityConstraints

	| ex ex2 constraint solver |
	ex := ExampleClass new.
	ex a: 15.
	ex b: 15.
	ex2 := ExampleClass new.
	ex2 a: 5.
	ex2 b: 5.
	solver := ConstraintSolver newZ3Solver.

	self shouldnt: [[ex a <= 10] alwaysSolveWith: solver] raise: Error.
	self shouldnt: [[ex b >= 20] alwaysSolveWith: solver] raise: Error.
	self should: [[ex a = ex b] alwaysSolveWith: solver] raise: ConstraintUnsatisfiableError.

	self shouldnt: [[ex a <= ex2 a] alwaysSolveWith: solver] raise: Error.
	self shouldnt: [constraint := [ex2 a >= 20] alwaysSolveWith: solver] raise: Error.
	constraint disable.
	self shouldnt: [constraint := [ex2 a <= 5] alwaysSolveWith: solver] raise: Error.
	constraint disable.

	self shouldnt: [[ex b <= ex2 a] alwaysSolveWith: solver] raise: Error.
	self should: [[ex2 a <= 10] alwaysSolveWith: solver] raise: ConstraintUnsatisfiableError.