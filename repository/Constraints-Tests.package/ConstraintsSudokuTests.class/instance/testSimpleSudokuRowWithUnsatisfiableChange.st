testing
testSimpleSudokuRowWithUnsatisfiableChange

	| sudoku solver |
	sudoku := SudokuGrid buildFromString: SudokuGrid defaultInputFile.
	solver := ConstraintSolver newZ3Solver.
	solver variableType: #'Int'.

	self shouldnt: [[(sudoku atRow: 1) allSatisfy: [:each | each >= 1 & (each <= 9)]] alwaysSolveWith: solver] raise: Error.
	self should: [(sudoku atRow: 1) allSatisfy: [:each | each >= 1 & (each <= 9)]].
	self should: [(sudoku atRow: 1) allSatisfy: [:each | each isInteger]].

	self should: [sudoku at: 1 at: 1 put: 17] raise: ConstraintUnsatisfiableError.
	self should: [(sudoku atRow: 1) allSatisfy: [:each | each >= 1 & (each <= 9)]].