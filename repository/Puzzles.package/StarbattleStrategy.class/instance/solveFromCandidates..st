solving
solveFromCandidates: aMatrix
"This method applies the rules to aMatrix. Therefore, the given matrix may be changed."
	self 
		inputMatrix: aMatrix;
		solvedCells: false;	
		checkStrategyForRows;
		checkStrategyForColumns;
		checkStrategyForRegions;
		checkStrategyForNeighbors.
	"Transcript cr.
	aMatrix printGrid.
	self halt."