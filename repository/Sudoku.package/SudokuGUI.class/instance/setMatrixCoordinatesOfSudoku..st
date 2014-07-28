updating
setMatrixCoordinatesOfSudoku: aSudokuGrid
	"Sets the x and y coordinates of the corresponding matrix."
	| a b c d |
	
	a := 0.
	grid submorphs do:
	[:threeBoxes | a := a + 1. b := 0. threeBoxes submorphs do:
		[:box | b := b + 1. c := 0. box submorphs do:
			[:threeCells | c := c + 1. d := 0. threeCells submorphs do:
				[:cell | d := d + 1. 
						cell sudokuModel: aSudokuGrid; xCoord: ((b-1)*3+d); yCoord: ((a-1)*3+c).
						sudokuCellDict at: ((b-1)*3+d)@((a-1)*3+c) put: cell.]]]]. 