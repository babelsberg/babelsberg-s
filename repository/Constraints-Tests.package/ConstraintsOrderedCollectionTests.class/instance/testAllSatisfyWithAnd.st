testing
testAllSatisfyWithAnd

	| ex solver |
	ex := ExampleClass new.
	ex collection add: -1; add: 17; add: 0; add: 5.
	solver := ConstraintSolver newZ3Solver.

	self shouldnt: [[ex collection allSatisfy: [:each | each >= 1 & (each <= 9)]] alwaysSolveWith: solver] raise: Error.
	self should: [ex collection allSatisfy: [:each | each >= 1 & (each <= 9)]].