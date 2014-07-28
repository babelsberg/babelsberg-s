solving
findHighlightCandidatesForBoxes
	1 to: removeCandidates boxCount do:
		[:box | | allNumbers | 	
				allNumbers := (removeCandidates atBox: box) flatten asSet. 
				(inputMatrix atBox: box) 
					select: [:cellCandidates | cellCandidates size = 1 and: [allNumbers includes: cellCandidates first]]
					thenDo: [:highlightNumber | 
							| cellIndexInBox | 
							cellIndexInBox := (inputMatrix atBox: box) indexOf: highlightNumber.  
							highlightCandidates 
								at: (SudokuGrid indexOfbox: box cell: cellIndexInBox) x   
								at: (SudokuGrid indexOfbox: box cell: cellIndexInBox) y 
								put: highlightNumber]]