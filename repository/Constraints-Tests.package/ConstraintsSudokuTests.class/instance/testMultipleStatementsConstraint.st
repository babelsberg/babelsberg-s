testing
testMultipleStatementsConstraint

	| sudoku solver |
	sudoku := SudokuGrid buildFromString: SudokuGrid defaultInputFile.
	solver := ConstraintSolver newZ3Solver.
	solver variableType: #'Int'.

	self shouldnt: [[	(sudoku atRow: 1) allDifferent.
					((sudoku atRow: 1) allSatisfy: [:each | each >= 1 & (each <= 9)]).
					true] alwaysSolveWith: solver] raise: Error.
	"The last condition is interpreted as constraint."
	self shouldnt: [(sudoku atRow: 1) asSet size = 9].
	self shouldnt: [(sudoku atRow: 1) allSatisfy: [:each | each >= 1 & (each <= 9)]].
