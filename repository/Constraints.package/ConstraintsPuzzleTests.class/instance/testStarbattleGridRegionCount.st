testing
testStarbattleGridRegionCount

	| starbattle solver |
	starbattle := StarbattleGrid newFromFile: 'starbattle.txt'.
	solver := ConstraintSolver newZ3Solver.

	self shouldnt: [[(starbattle regions at: 1) count: [:elem | elem isStar] result: 2] alwaysSolveWith: solver] raise: Error.
	self should: [((starbattle regions at: 1) count: [:elem | elem isStar]) = 2].