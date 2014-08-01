testing
testStarbattleCollectStars

	| starbattle solver |
	starbattle := StarbattleGrid buildFromString: StarbattleGrid defaultInputFile.
	solver := ConstraintSolver newZ3Solver.

	self shouldnt: [[(starbattle collect: [:each | each isStar]) count: [:each | each] result: (2 * starbattle size sqrt)] alwaysSolveWith: solver] raise: Error.
	
	self should: [(starbattle collect: [:each | each isStar]) count: [:each | each] result: (2 * starbattle size sqrt)].