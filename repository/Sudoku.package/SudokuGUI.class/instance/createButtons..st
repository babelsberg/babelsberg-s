initialization
createButtons: sudokuSolver
	"This method creates three buttons that are used to take the next step of solving the Sudoku."
	
	self 
		createButtonWrapper;
		createTakeStepButton: sudokuSolver;
		createPlayPauseButton: sudokuSolver.
		
	buttonWrapper 
		addMorph: takeStepButton;
		addMorph: playButton after: takeStepButton.
		
	layoutWrapper addMorph: buttonWrapper after: grid. 
	