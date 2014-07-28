testing
testSimpleSudokuDiagonal2

	| sudoku solver |
	sudoku := SudokuDiagonal newFromFile: 'sudoku_diagonal.txt'.
	solver := ConstraintSolver newZ3Solver.
	solver variableType: 'Int'.

	self shouldnt: [[sudoku diagonalFromTopRightToBottomLeft allDifferent] alwaysSolveWith: solver] raise: Error.
	self shouldnt: [[sudoku diagonalFromTopRightToBottomLeft allSatisfy: [:each | each >= 1 & (each <= 9)]] alwaysSolveWith: solver] raise: Error.

	self should: [sudoku diagonalFromTopRightToBottomLeft asSet size = 9].
	self should: [sudoku diagonalFromTopRightToBottomLeft allSatisfy: [:each | each >= 1 & (each <= 9)]].
	self should: [sudoku diagonalFromTopRightToBottomLeft allSatisfy: [:each | each isInteger]].