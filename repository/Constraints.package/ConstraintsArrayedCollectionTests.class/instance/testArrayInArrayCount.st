testing
testArrayInArrayCount

	| ex solver |
	ex := ExampleClass new.
	ex arrayCollection: (Array new: 3).
	ex arrayCollection at: 1 put: #(1 2 3 2 5 3).
	ex arrayCollection at: 2 put: #(1 2 3 3).
	ex arrayCollection at: 3 put: #(1 2 3).
	solver := ConstraintSolver newZ3Solver.

	self shouldnt: [[ex arrayCollection first count: [:each | each = 2] result: 4] alwaysSolveWith: solver] raise: Error.
	self should: [(ex arrayCollection first count: [:each | each = 2]) = 4].