testing
testSudokuRule

	| ex solver |
	ex := ExampleClass new.
	ex collection add: 0; add: 0; add: 1; add: 2; add: 17; add: 23; add: 42; add: 42; add: -5.
	solver := ConstraintSolver newZ3Solver.

	self shouldnt: [[ex collection allDifferent] alwaysSolveWith: solver] raise: Error.
	self shouldnt: [[ex collection allSatisfy: [:each | each >= 1 & (each <= 9)]] alwaysSolveWith: solver] raise: Error.
	self shouldnt: [[ex collection allSatisfy: [:each | each isInteger]] alwaysSolveWith: solver] raise: Error.

	self should: [ex collection asSet size = 9].
	self should: [ex collection allSatisfy: [:each | each >= 1 & (each <= 9)]].
	self should: [ex collection allSatisfy: [:each | each isInteger]].