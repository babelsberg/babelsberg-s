building
buildSudokuSolver
	sudokuSolver := SudokuSolver new. 
	strategies := OrderedCollection 
					with: SudokuStrategyRulesChecker new 
					with: SudokuStrategyHiddenSingles new 
					with: SudokuStrategyNakedPairs new
					with: SudokuStrategyHiddenPairs new
					with: SudokuStrategyPointingPairs new
					with: SudokuStrategyBoxLineReduction new.
	strategies add: SudokuStrategyYWing new.
	sudokuSolver strategies: strategies.