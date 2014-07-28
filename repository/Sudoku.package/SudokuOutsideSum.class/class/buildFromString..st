instance creation
buildFromString: aString

	| lines sudoku |
	sudoku := SudokuOutsideSum new: 9 element: 0.
 	lines := aString lines.
	lines first substrings do: [:digit | sudoku topSums add: digit asNumber].
	lines second substrings do: [:digit | sudoku bottomSums add: digit asNumber].
	lines third substrings do: [:digit | sudoku leftSums add: digit asNumber].
	lines fourth substrings do: [:digit | sudoku rightSums add: digit asNumber].

	sudoku sudokuGui: SudokuGUIOutsideSum new.
	sudoku sudokuGui updateCells: sudoku ofType: #number.
	sudoku sudokuGui setMatrixCoordinatesOfSudoku: sudoku.
	sudoku sudokuGui numbers: sudoku.
	sudoku sudokuGui createConstraintButtons.
	sudoku sudokuGui setOutsideSums.

	^ sudoku