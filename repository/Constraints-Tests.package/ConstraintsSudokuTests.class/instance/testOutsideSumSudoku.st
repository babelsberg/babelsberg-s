testing
testOutsideSumSudoku

	| sudoku solver |
	sudoku := SudokuOutsideSum buildFromString: SudokuOutsideSum defaultInputFile.
	solver := ConstraintSolver newZ3Solver.
	solver variableType: #'Int'.

	self shouldnt: [sudoku createSumConstraints] raise: Error.

	self should: [(sudoku at: 1 at: 1) + (sudoku at: 2 at: 1) + (sudoku at: 3 at: 1) = 6]. "example for topSums"
	self should: [(sudoku at: 9 at: 3) + (sudoku at: 8 at: 3) + (sudoku at: 7 at: 3) = 16]. "example for bottomSums"
	self should: [(sudoku at: 2 at: 1) + (sudoku at: 2 at: 2) + (sudoku at: 2 at: 3) = 19]. "example for leftSums"
	self should: [(sudoku at: 8 at: 9) + (sudoku at: 8 at: 8) + (sudoku at: 8 at: 7) = 17]. "example for rightSums"