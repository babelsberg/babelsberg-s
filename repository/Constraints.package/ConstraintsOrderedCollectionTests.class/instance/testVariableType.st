testing
testVariableType

	| ex solver |
	ex := ExampleClass new.
	ex collection add: 1.5; add: -2; add: true.
	solver := ConstraintSolver newZ3Solver.

	self shouldnt: [[ex collection allSatisfy: [:each | each isInteger]] alwaysSolveWith: solver] raise: Error.
	self should: [ex collection allSatisfy: [:each | each isInteger]].