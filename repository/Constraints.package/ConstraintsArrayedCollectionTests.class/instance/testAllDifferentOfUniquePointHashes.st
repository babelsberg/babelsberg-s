testing
testAllDifferentOfUniquePointHashes

	| ex solver pointHashes |
	ex := ExampleClass new.
	ex arrayCollection: (Array new: 4).
	ex arrayCollection at: 1 put: (PuzzlePoint new x: 1; y: 1).
	ex arrayCollection at: 2 put: (PuzzlePoint new x: 1; y: 1).
	ex arrayCollection at: 3 put: (PuzzlePoint new x: 1; y: 1).
	ex arrayCollection at: 4 put: (PuzzlePoint new x: 1; y: 1).
	solver := ConstraintSolver newZ3Solver.
	solver variableType: 'Int'.

	self shouldnt: [[(ex arrayCollection collect: [:pt | pt y - 1 * 5 + pt x - 1]) allDifferent] alwaysSolveWith: solver] raise: Error.
	pointHashes := (ex arrayCollection collect: [:pt | pt y - 1 * 5 + pt x - 1]).
	self should: [pointHashes allDifferent].