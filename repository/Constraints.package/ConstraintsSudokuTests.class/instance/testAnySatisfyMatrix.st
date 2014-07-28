testing
testAnySatisfyMatrix

	| ex solver |
	ex := ExampleClass new.
	ex matrixCollection: (Matrix new: 2).
	ex matrixCollection at: 1 at: 1 put: 1.
	ex matrixCollection at: 1 at: 2 put: 2.
	ex matrixCollection at: 2 at: 1 put: 0.
	ex matrixCollection at: 2 at: 2 put: 3.
	solver := ConstraintSolver newZ3Solver.

	self shouldnt: [[ex matrixCollection anySatisfy: [:each | each >= 3]] alwaysSolveWith: solver] raise: Error.
	self should: [ex matrixCollection anySatisfy: [:each | each >= 3]].