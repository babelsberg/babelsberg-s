updating
updateSudokuGUI
	| removeCandidates |
	removeCandidates := sudokuSolver removeCandidates.
	sudokuGUI updateCells: removeCandidates ofType: #removeCandidates.