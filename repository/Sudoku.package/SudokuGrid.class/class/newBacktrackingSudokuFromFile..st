instance creation
newBacktrackingSudokuFromFile: aFileName

	| sudoku |
	sudoku := self newFromFile: aFileName.
	sudoku solver: BacktrackingStrategy new.
	^ sudoku