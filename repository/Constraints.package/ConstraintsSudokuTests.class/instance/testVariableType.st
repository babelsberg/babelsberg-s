testing
testVariableType

	| ex solver |
	ex := ExampleClass new.
	ex matrixCollection: (Matrix new: 2).
	ex matrixCollection at: 1 at: 1 put: 1.5.
	ex matrixCollection at: 1 at: 2 put: -2.
	ex matrixCollection at: 2 at: 1 put: 0.
	ex matrixCollection at: 2 at: 2 put: true.
	solver := ConstraintSolver newZ3Solver.

	self shouldnt: [[ex matrixCollection allSatisfy: [:each | each isInteger]] alwaysSolveWith: solver] raise: Error.
	self should: [ex matrixCollection allSatisfy: [:each | each isInteger]].