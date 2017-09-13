testing
testSum

	| ex solver |
	ex := ExampleClass new.
	ex arrayCollection: #(1 1 2 2 3).
	solver := ConstraintSolver newZ3Solver.

	self shouldnt: [[ex arrayCollection sum = 17] alwaysSolveWith: solver] raise: Error.
	self should: [ex arrayCollection sum = 17].