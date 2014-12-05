instance creation
newBacktrackingSudoku

	| sudoku |
	sudoku := self buildFromString: self defaultInputFile.
	sudoku solver: BacktrackingStrategy new.
	^ sudoku