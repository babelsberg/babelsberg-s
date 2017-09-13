testing
testStarbattleGridColumnCount

	| starbattle solver |
	starbattle := StarbattleGrid buildFromString: StarbattleGrid defaultInputFile.
	solver := ConstraintSolver newZ3Solver.

	"(starbattle atColumn: 1) gibt ein Array, kein ConstraintArray, zurück. Dadurch kann count: nicht aufgerufen werden."
	self shouldnt: [[(starbattle atColumn: 1) count: [:elem | elem isStar] equals: 2] alwaysSolveWith: solver] raise: Error.

	self should: [((starbattle atColumn: 1) count: [:elem | elem isStar]) = 2].