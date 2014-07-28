testing
testAllSatisfyMatrixWithAnd

	| ex solver |
	ex := ExampleClass new.
	ex matrixCollection: (Matrix new: 2).
	ex matrixCollection at: 1 at: 1 put: 1.
	ex matrixCollection at: 1 at: 2 put: 5.
	ex matrixCollection at: 2 at: 1 put: -2.
	ex matrixCollection at: 2 at: 2 put: 17.
	solver := ConstraintSolver newZ3Solver.

	self shouldnt: [[ex matrixCollection allSatisfy: [:each | each >= 1 & (each <= 9)]] alwaysSolveWith: solver] raise: Error.
	self should: [ex matrixCollection allSatisfy: [:each | each >= 1 & (each <= 9)]].