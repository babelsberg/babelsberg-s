testing
testStarbattleGridRegionCount

	| starbattle solver |
	starbattle := StarbattleGrid buildFromString: StarbattleGrid defaultInputFile.
	solver := ConstraintSolver newZ3Solver.

	self shouldnt: [[(starbattle regions at: 1) count: [:elem | elem isStar] result: 2] alwaysSolveWith: solver] raise: Error.
	self should: [((starbattle regions at: 1) count: [:elem | elem isStar]) = 2].