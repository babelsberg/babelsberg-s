testing
testSudokuRowCollect

	| sudoku solver |
	sudoku := SudokuGrid buildFromString: SudokuGrid defaultInputFile.
	solver := ConstraintSolver newZ3Solver.
	solver variableType: 'Int'.

	self shouldnt: [[(sudoku collect: [:each | each + 3]) allSatisfy: [:val | val between: 4 and: 12]] alwaysSolveWith: solver] raise: Error.
	self should: [(sudoku collect: [:each | each + 3]) allSatisfy: [:val | val between: 4 and: 12]].