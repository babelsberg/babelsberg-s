solving
initializeHighlightCandidates

	highlightCandidates := SudokuGrid new: 9.
	highlightCandidates indicesDo:   
		[:i :j | highlightCandidates at: i at: j put: OrderedCollection new].