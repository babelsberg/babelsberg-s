updating
updateCells: aMatrix ofType: aSymbol
	"Sets the values of the grid according to the given matrix. The values can be #number or #candidates."
	| a b c d |
	
	a := 0.
	grid submorphs do:
	[:threeBoxes | a := a + 1. b := 0. threeBoxes submorphs do:
		[:box | b := b + 1. c := 0. box submorphs do:
			[:threeCells | c := c + 1. d := 0. threeCells submorphs do:
				[:cell | d := d + 1. cell 
									updateContent: (aMatrix at: ((b-1)*3+d) at: ((a-1)*3+c)) 
									ofType: aSymbol]]]]. 