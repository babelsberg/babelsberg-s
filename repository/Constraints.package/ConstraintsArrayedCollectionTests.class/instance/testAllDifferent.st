testing
testAllDifferent

	| ex solver |
	ex := ExampleClass new.
	ex arrayCollection: #(1 1 2 2 3).
	solver := ConstraintSolver newZ3Solver.

	self shouldnt: [[ex arrayCollection allDifferent] alwaysSolveWith: solver] raise: Error.
	self should: [ex arrayCollection asSet size = 5].