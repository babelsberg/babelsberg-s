testing
testStarbattleNeighborCount

	| starbattle solver |
	starbattle := StarbattleGrid newFromFile: 'starbattle.txt'.
	solver := ConstraintSolver newZ3Solver.

	"neighborsOfXy: returns an orderedCollection, not a ConstraintArray."
	self shouldnt: [[(starbattle mooreNeighborsOfX: 2 y: 1)
		count: [:neighborCell | neighborCell isStar] result: 1] alwaysSolveWith: solver] raise: Error.
	
	self should: [((starbattle mooreNeighborsOfX: 2 y: 1)
		count: [:neighborCell | neighborCell isStar]) = 1].
