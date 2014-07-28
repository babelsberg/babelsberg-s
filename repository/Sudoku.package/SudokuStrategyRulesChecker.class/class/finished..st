as yet unclassified
finished: aSudokuGrid
"This method checks if the Sudoku grid is solved completely and correctly."
	(aSudokuGrid allSatisfy: [:candidateList | candidateList size = 1])  
		ifFalse: [^false]
		ifTrue: [^self isValid: aSudokuGrid]    