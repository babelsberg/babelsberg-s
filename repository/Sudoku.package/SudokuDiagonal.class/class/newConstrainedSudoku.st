instance creation
newConstrainedSudoku

	| sudoku |
	sudoku := super newConstrainedSudoku.
	sudoku sudokuGui changeColorOfDiagonalCellsTo: Color yellow.
	^ sudoku