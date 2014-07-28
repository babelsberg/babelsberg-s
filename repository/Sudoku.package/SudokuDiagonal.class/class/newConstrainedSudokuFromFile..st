instance creation
newConstrainedSudokuFromFile: aFileName

	| sudoku |
	sudoku := super newConstrainedSudokuFromFile: aFileName.
	sudoku sudokuGui changeColorOfDiagonalCellsTo: Color yellow.
	^ sudoku