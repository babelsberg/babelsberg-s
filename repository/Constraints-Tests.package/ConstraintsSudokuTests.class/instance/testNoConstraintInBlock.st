testing
testNoConstraintInBlock

	| sudoku solver |
	sudoku := SudokuGrid buildFromString: SudokuGrid defaultInputFile.
	solver := ConstraintSolver newZ3Solver.
	solver variableType: #'Int'.

	self shouldnt: [(sudoku atRow: 1) asSet size = 9].
	self shouldnt: [(sudoku atRow: 1) allSatisfy: [:each | each >= 1 & (each <= 9)]].

	self should: [[((sudoku atRow: 1) allSatisfy: [:each | each >= 1 & (each <= 9)]) &
					(sudoku atRow: 1) allDifferent. false] alwaysSolveWith: solver] raise: Error.

	self shouldnt: [(sudoku atRow: 1) asSet size = 9].
	self shouldnt: [(sudoku atRow: 1) allSatisfy: [:each | each >= 1 & (each <= 9)]].
	self should: [solver constraints isEmpty].