initialization
initializeGrid 

	grid := self createCellsFrom: SudokuCandidateCell new.
	grid borderWidth: 0.