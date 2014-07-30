testing
testNoneSatisfyNeighborCount

	| puzzle solver someCells |
	puzzle := StarbattleGrid buildFromString: StarbattleGrid defaultInputFile.
	solver := ConstraintSolver newZ3Solver.
	someCells := (Array with: (puzzle at: 2 at: 3) with: (puzzle at: 4 at: 4)).

	self shouldnt: [[someCells noneSatisfy: [:cell | 
		cell neighbors count: [:neighbor | neighbor isStar] result: 1]] alwaysSolveWith: solver] raise: Error.
	
	self should: [someCells noneSatisfy: [:cell | 
		cell neighbors count: [:neighbor | neighbor isStar] result: 1]].