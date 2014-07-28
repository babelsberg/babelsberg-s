testing
testAllSatisfyWithAnd

	| ex solver |
	ex := ExampleClass new.
	ex arrayCollection: #(-1 1.7 0 5).
	solver := ConstraintSolver newZ3Solver.

	self shouldnt: [[ex arrayCollection allSatisfy: [:each | each >= 1 & (each <= 9)]] alwaysSolveWith: solver] raise: Error.
	self should: [ex arrayCollection allSatisfy: [:each | each >= 1 & (each <= 9)]].