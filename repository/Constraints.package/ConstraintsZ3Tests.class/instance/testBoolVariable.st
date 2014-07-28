testing
testBoolVariable

	| ex solver constraint |
	ex := ExampleClass new.
	ex a: false.
	solver := ConstraintSolver newZ3Solver.

	self shouldnt: [constraint := [ex a] alwaysSolveWith: solver] raise: Error.
	self should: [ex a].
	constraint disable.

	self should: [ex a].
	self shouldnt: [[ex a not] alwaysSolveWith: solver] raise: Error.
	self shouldnt: [ex a].