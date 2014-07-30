testing
testStarbattleSelectStar2

	| starbattle solver |
	starbattle := StarbattleGrid buildFromString: StarbattleGrid defaultInputFile.
	solver := ConstraintSolver newZ3Solver.

	self shouldnt: [[((starbattle atRow: 1) select: [:cell | cell isStar value])
						allSatisfy: [:cell | cell hasNoNeighborStars]] alwaysSolveWith: solver] raise: Error.
	
	self should: [((starbattle atRow: 1) select: [:cell | cell isStar])
		allSatisfy: [:cell | cell hasNoNeighborStars]].