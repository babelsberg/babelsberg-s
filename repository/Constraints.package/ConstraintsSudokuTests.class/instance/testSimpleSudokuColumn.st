testing
testSimpleSudokuColumn

	| sudoku solver |
	sudoku := SudokuGrid buildFromString: SudokuGrid defaultInputFile.
	solver := ConstraintSolver newZ3Solver.
	solver variableType: 'Int'.

	self shouldnt: [[(sudoku atColumn: 1) allDifferent] alwaysSolveWith: solver] raise: Error.
	self shouldnt: [[(sudoku atColumn: 1) allSatisfy: [:each | each >= 1 & (each <= 9)]] alwaysSolveWith: solver] raise: Error.

	self should: [(sudoku atColumn: 1) asSet size = 9].
	self should: [(sudoku atColumn: 1) allSatisfy: [:each | each >= 1 & (each <= 9)]].
	self should: [(sudoku atColumn: 1) allSatisfy: [:each | each isInteger]].