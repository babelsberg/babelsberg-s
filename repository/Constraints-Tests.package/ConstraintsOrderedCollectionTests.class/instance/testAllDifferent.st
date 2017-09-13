testing
testAllDifferent

	| ex solver |
	ex := ExampleClass new.
	ex collection add: 1; add: 1; add: 2; add: 2; add: 3.
	solver := ConstraintSolver newZ3Solver.

	self shouldnt: [[ex collection allDifferent] alwaysSolveWith: solver] raise: Error.
	self should: [ex collection asSet size = 5].