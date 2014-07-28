testing
testStarbattleGridNoTouch2

	| starbattle solver |
	starbattle := StarbattleGrid newFromFile: 'starbattle.txt'.
	solver := ConstraintSolver newZ3Solver.

	(1 to: starbattle rowCount) do: [:column | 
		self shouldnt: [
			[((starbattle at: 1 at: column) isStar not) |
			((starbattle mooreNeighborsOfX: 1 y: column)
				count: [:neighborCell | neighborCell isStar] result: 0)] alwaysSolveWith: solver] 
		raise: Error].

	(1 to: starbattle rowCount) do: [:column | 
		self should: [
			(starbattle at: 1 at: column) isStar not | 
			((starbattle mooreNeighborsOfX: 1 y: column)
				count: [:neighborCell | neighborCell isStar] result: 0)]].