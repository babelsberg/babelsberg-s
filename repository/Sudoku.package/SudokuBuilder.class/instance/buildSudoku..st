building
buildSudoku: fileName
	self 
		buildSudokuSolver;
		buildSudokuGUI;
		buildSudokuSolverStates.
	sudokuSolver 
		fileName: fileName;  
		takeStep; takeStep.
	sudokuGUI openInWorld.