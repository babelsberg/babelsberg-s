accessing
cellAtX: xCoord Y: yCoord
	"This method returns the SudokuCell, that belongs to the given coordinates."
	^ sudokuCellDict at: xCoord@yCoord ifAbsent: [nil]