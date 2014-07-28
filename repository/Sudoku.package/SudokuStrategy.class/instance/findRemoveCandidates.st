solving
findRemoveCandidates

	removeCandidates := SudokuGrid newFrom: inputMatrix.
	removeCandidates indicesDo:
		[:i :j | (removeCandidates at: i at: j) removeAll: (candidates at: i at:j)]