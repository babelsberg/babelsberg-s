solving
solveFromCandidates: aMatrix
	inputMatrix := SudokuGrid newFrom: aMatrix.
	candidates := SudokuGrid newFrom: aMatrix.
	solvedCells := false.
	self
		initializeHighlightCandidates;
		checkStrategyForRows;
		checkStrategyForColumns;
		checkStrategyForBoxes;
		findRemoveCandidates;
		findHighlightCandidates.
	^ solvedCells