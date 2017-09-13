testing
testAllDifferentMatrix

	| ex solver |
	ex := ExampleClass new.
	ex matrixCollection: (Matrix new: 2).
	ex matrixCollection at: 1 at: 1 put: 1.
	ex matrixCollection at: 1 at: 2 put: 1.
	ex matrixCollection at: 2 at: 1 put: 2.
	ex matrixCollection at: 2 at: 2 put: 3.
	solver := ConstraintSolver newZ3Solver.

	self shouldnt: [[ex matrixCollection allDifferent] alwaysSolveWith: solver] raise: Error.
	self should: [ex matrixCollection asSet size = 4].