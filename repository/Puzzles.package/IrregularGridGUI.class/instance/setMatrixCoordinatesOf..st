updating
setMatrixCoordinatesOf: anIrregularPuzzleGrid
	"Sets the x and y coordinates of the corresponding matrix."
	grid submorphs withIndexDo:
	[:morph :row | morph submorphs withIndexDo: 
		[:cell :column | 
			cell sudokuModel: anIrregularPuzzleGrid; xCoord: row; yCoord: column.
			sudokuCellDict at: row@column put: cell]].