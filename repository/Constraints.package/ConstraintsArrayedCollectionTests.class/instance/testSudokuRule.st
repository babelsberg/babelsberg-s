testing
testSudokuRule

	| ex solver |
	ex := ExampleClass new.
	ex arrayCollection: #(0 0 1 2 17 23 42 42 -5).
	solver := ConstraintSolver newZ3Solver.

	self shouldnt: [[ex arrayCollection allDifferent] alwaysSolveWith: solver] raise: Error.
	self shouldnt: [[ex arrayCollection allSatisfy: [:each | each >= 1 & (each <= 9)]] alwaysSolveWith: solver] raise: Error.
	self shouldnt: [[ex arrayCollection allSatisfy: [:each | each isInteger]] alwaysSolveWith: solver] raise: Error.

	self should: [ex arrayCollection asSet size = 9].
	self should: [ex arrayCollection allSatisfy: [:each | each >= 1 & (each <= 9)]].
	self should: [ex arrayCollection allSatisfy: [:each | each isInteger]].