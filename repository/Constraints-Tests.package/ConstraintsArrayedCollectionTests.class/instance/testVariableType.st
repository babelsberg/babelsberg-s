testing
testVariableType

	| ex solver |
	ex := ExampleClass new.
	ex arrayCollection: #(1.5 -2 true).
	solver := ConstraintSolver newZ3Solver.

	self shouldnt: [[ex arrayCollection allSatisfy: [:each | each isInteger]] alwaysSolveWith: solver] raise: Error.
	self should: [ex arrayCollection allSatisfy: [:each | each isInteger]].