instance creation
newConstrainedSudokuFromFile: aFileName

	| sudoku |
	sudoku := self newFromFile: aFileName.
	sudoku createConstraints.
	sudoku sudokuGui openInWorld.
	^ sudoku