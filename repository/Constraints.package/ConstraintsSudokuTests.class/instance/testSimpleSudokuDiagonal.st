testing
testSimpleSudokuDiagonal

	| sudoku solver |
	sudoku := SudokuDiagonal newFromFile: 'sudoku_diagonal.txt'.
	solver := ConstraintSolver newZ3Solver.
	solver variableType: 'Int'.

	self shouldnt: [[sudoku diagonalFromTopLeftToBottomRight allDifferent] alwaysSolveWith: solver] raise: Error.
	self shouldnt: [[sudoku diagonalFromTopLeftToBottomRight allSatisfy: [:each | each >= 1 & (each <= 9)]] alwaysSolveWith: solver] raise: Error.

	self should: [sudoku diagonalFromTopLeftToBottomRight asSet size = 9].
	self should: [sudoku diagonalFromTopLeftToBottomRight allSatisfy: [:each | each >= 1 & (each <= 9)]].
	self should: [sudoku diagonalFromTopLeftToBottomRight allSatisfy: [:each | each isInteger]].