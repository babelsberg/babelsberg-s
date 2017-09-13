testing
testPentominoPuzzle

	| puzzle solver |
	puzzle := PentominoPuzzle newWithPentominoes: {$u. $x. $i. $l. $t. $y} size: 5@6.
	solver := ConstraintSolver newZ3Solver.

	self shouldnt: [[puzzle containsPentomino: $i] alwaysSolveWith: solver] raise: Error.
	self should: [puzzle containsPentomino: $i].
