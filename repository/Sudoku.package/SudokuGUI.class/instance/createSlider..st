initialization
createSlider: aSudokuSolver

	slider := SudokuSlider new.
	slider sudokuSolver: aSudokuSolver.
	^ slider.