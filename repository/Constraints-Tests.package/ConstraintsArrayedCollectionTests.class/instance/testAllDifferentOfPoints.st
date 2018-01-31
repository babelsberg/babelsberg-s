testing
testAllDifferentOfPoints

	| ex solver |
	ex := ExampleClass new.
	ex arrayCollection: (Array new: 4).
	ex arrayCollection at: 1 put: (PuzzlePoint new x: 1; y: 1).
	ex arrayCollection at: 2 put: (PuzzlePoint new x: 1; y: 1).
	ex arrayCollection at: 3 put: (PuzzlePoint new x: 1; y: 1).
	ex arrayCollection at: 4 put: (PuzzlePoint new x: 1; y: 1).
	solver := ConstraintSolver newZ3Solver.
	solver variableType: #'Int'.

	self shouldnt: [[ex arrayCollection allDifferent] alwaysSolveWith: solver] raise: Error.
	self should: [ex arrayCollection allDifferent].