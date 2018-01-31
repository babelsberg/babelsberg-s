testing
testUnsatisfiableAllDifferent

	| sudoku solver |
	sudoku := SudokuGrid buildFromString: SudokuGrid defaultInputFile.
	solver := ConstraintSolver newZ3Solver.
	solver variableType: #'Int'.

	self shouldnt: [[(sudoku atRow: 1) allSatisfy: [:each | each >= 1 & (each <= 5)]] alwaysSolveWith: solver] raise: Error.
	self should: [(sudoku atRow: 1) allSatisfy: [:each | each >= 1 & (each <= 5)]].

	self should: [[(sudoku atRow: 1) allDifferent] alwaysSolveWith: solver] raise: ConstraintUnsatisfiableError.
	self should: [(sudoku atRow: 1) allSatisfy: [:each | each >= 1 & (each <= 5)]].