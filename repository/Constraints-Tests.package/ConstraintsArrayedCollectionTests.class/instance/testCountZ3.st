testing
testCountZ3

	| ex solver |
	ex := ExampleClass new.
	ex arrayCollection: #(3 1 -2 0 -5.5).
	solver := ConstraintSolver newZ3Solver.

	self shouldnt: [[(ex arrayCollection count: [:each | each = 1]) = 2] alwaysSolveWith: solver] raise: Error.
	self should: [(ex arrayCollection count: [:each | each = 1]) = 2].