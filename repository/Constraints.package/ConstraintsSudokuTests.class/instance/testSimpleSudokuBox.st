testing
testSimpleSudokuBox

	| sudoku solver |
	sudoku := SudokuGrid newFromFile: 'sudoku.txt'.
	solver := ConstraintSolver newZ3Solver.
	solver variableType: 'Int'.

	self shouldnt: [[(sudoku atBox: 1) allDifferent] alwaysSolveWith: solver] raise: Error.
	self shouldnt: [[(sudoku atBox: 1) allSatisfy: [:each | each >= 1 & (each <= 9)]] alwaysSolveWith: solver] raise: Error.

	self should: [(sudoku atBox: 1) asSet size = 9].
	self should: [(sudoku atBox: 1) allSatisfy: [:each | each >= 1 & (each <= 9)]].
	self should: [(sudoku atBox: 1) allSatisfy: [:each | each isInteger]].