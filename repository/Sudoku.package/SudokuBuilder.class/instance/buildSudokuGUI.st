building
buildSudokuGUI
	| strategyDisplay historySlider |
	sudokuGUI := SudokuGUI new.
	sudokuGUI createButtons: sudokuSolver.
	historySlider := sudokuGUI createSlider: sudokuSolver.
	strategyDisplay := sudokuGUI createStrategyDisplay: strategies.
	sudokuGUI connectSubmorphs.
	sudokuSolver strategyDisplay: strategyDisplay.
	sudokuSolver historySlider: historySlider.