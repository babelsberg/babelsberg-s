testing
testStarbattleGridRowCount

	| starbattle solver |
	starbattle := StarbattleGrid buildFromString: StarbattleGrid defaultInputFile.
	solver := ConstraintSolver newZ3Solver.

	self shouldnt: [[((starbattle atRow: 1) count: [:elem | elem isStar]) = 2] alwaysSolveWith: solver] raise: Error.
	self should: [((starbattle atRow: 1) count: [:elem | elem isStar]) = 2].