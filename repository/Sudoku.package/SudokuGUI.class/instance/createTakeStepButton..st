initialization
createTakeStepButton: sudokuSolver
	"This method creates a button that is used to take the next step of solving the Sudoku."
	takeStepButton := SimpleButtonMorph new.
	takeStepButton 
		actionSelector: #takeStep;
		target: sudokuSolver;
		label: 'Take Step' font: (((TextStyle named: 'BitstreamVeraSans') 
							    				fontOfSize: 36) emphasized: 1);
		layoutPolicy: TableLayout new;
		color: Color white;
		vResizing: #spaceFill;
		width: 69*9;
		layoutInset: 10;
		wrapCentering: #center.