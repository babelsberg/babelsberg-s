testing
testSimpleSudokuBoxWithChange

	| sudoku solver |
	sudoku := SudokuGrid buildFromString: SudokuGrid defaultInputFile.
	solver := ConstraintSolver newZ3Solver.
	solver variableType: 'Int'.

	self shouldnt: [[(sudoku atBox: 1) allDifferent] alwaysSolveWith: solver] raise: Error.
	self should: [(sudoku atBox: 1) asSet size = 9].
	self should: [(sudoku atBox: 1) allSatisfy: [:each | each isInteger]].

	self shouldnt: [(sudoku at: 1 at: 1) = 3].
	self shouldnt: [sudoku at: 1 at: 1 put: 3] raise: Error.
	self should: [(sudoku at: 1 at: 1) = 3].
	self should: [(sudoku atBox: 1) asSet size = 9].