testing
testAllSatisfyObjects

	| ex solver constraint |
	ex := ExampleClass new.
	ex collection add: 1; add: 2.
	solver := ConstraintSolver newZ3Solver.

	self shouldnt: [constraint := [ex collection allSatisfy: [:each | each >= 3]] alwaysSolveWith: solver] raise: Error.
	self should: [constraint expressions size = 2].