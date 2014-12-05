solving
solveFromCandidates: aMatrix
	solvedCells := false.
	self
		inputMatrix: aMatrix;
	"	initializeHighlightCandidates;"
		checkStrategyForRows;
		checkStrategyForColumns;
		checkStrategyForBoxes.
	"	findRemoveCandidates;"
"		findHighlightCandidates."
	^ solvedCells