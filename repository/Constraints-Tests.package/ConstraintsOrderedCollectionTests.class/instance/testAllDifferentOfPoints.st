testing
testAllDifferentOfPoints

	| ex solver pointHashes |
	ex := ExampleClass new.
	ex collection add: (PuzzlePoint new x: 1; y: 1).
	ex collection add: (PuzzlePoint new x: 1; y: 1).
	ex collection add: (PuzzlePoint new x: 1; y: 1).
	ex collection add: (PuzzlePoint new x: 1; y: 1).
	solver := ConstraintSolver newZ3Solver.
	solver variableType: #'Int'.

	self shouldnt: [[(ex collection collect: [:pt | pt y - 1 * 5 + pt x - 1]) allDifferent] alwaysSolveWith: solver] raise: Error.
	pointHashes := (ex collection collect: [:pt | pt y - 1 * 5 + pt x - 1]).
	self should: [pointHashes allDifferent].