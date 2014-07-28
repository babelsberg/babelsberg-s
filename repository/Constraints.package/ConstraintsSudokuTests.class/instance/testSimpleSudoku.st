testing
testSimpleSudoku

	| sudoku solver |
	sudoku := SudokuGrid newFromFile: 'sudoku.txt'.
	solver := ConstraintSolver newZ3Solver.
	solver variableType: 'Int'.

	self shouldnt: [[sudoku contents allDifferent] alwaysSolveWith: solver] raise: Error.
	self should: [sudoku contents asSet size = 81].