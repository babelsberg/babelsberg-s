updating
updateSudokuGUI
	| highlightCandidates |
	highlightCandidates := sudokuSolver highlightCandidates.
	sudokuGUI updateCells: highlightCandidates ofType: #highlight.