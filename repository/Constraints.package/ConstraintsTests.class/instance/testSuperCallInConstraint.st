testing
testSuperCallInConstraint

	| ex solver |
	ex := ExampleSubClass new.
	solver := ConstraintSolver newZ3Solver.
	self shouldnt: [[ex x = 42] alwaysSolveWith: solver] raise: Error.
	self should: [ex x = 42].

	self shouldnt: [[ex methodWithSuperCall = 23] alwaysSolveWith: solver] raise: Error.
	self should: [ex methodWithSuperCall = 23].
