testing
testAllDifferentObjectIdentity

	| ex point solver pointHashes |
	ex := ExampleClass new.
	ex arrayCollection: (Array new: 2).
	point := PuzzlePoint new x: 1; y: 1.
	ex arrayCollection at: 1 put: point.
	ex arrayCollection at: 2 put: point.
	solver := ConstraintSolver newZ3Solver.
	solver variableType: 'Int'.

	self should: [[(ex arrayCollection collect: [:pt | pt y - 1 * 5 + pt x - 1]) allDifferent] alwaysSolveWith: solver] raise: ConstraintUnsatisfiableError.
	pointHashes := (ex arrayCollection collect: [:pt | pt y - 1 * 5 + pt x - 1]).
	self shouldnt: [pointHashes allDifferent].