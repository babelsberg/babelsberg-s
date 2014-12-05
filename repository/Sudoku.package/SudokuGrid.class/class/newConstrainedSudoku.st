instance creation
newConstrainedSudoku

	| sudoku |
	sudoku := self buildFromString: self defaultInputFile.
	sudoku createConstraints.
	^ sudoku