building
buildSudokuSolverStates
	| allStates |
	allStates := OrderedCollection new.
	allStates 
		add: SudokuStateHighlightCandidates new;
		add: SudokuStateCandidatesToRemove new;
		add: SudokuStateCandidates new;
		add: SudokuStateNumbers new.
		
	allStates do:
		[:state | state sudokuGUI: sudokuGUI; sudokuSolver: sudokuSolver].
	
	sudokuSolver 
		allStates: allStates;
		currentState: 3.
