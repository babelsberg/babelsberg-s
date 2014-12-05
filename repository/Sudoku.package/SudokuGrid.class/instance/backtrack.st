solving
backtrack

	| candidates minimizer |
	candidates := self class getCandidatesMatrixFrom: self.
	minimizer := SudokuStrategyRulesChecker new. 
	minimizer solveFromCandidates: candidates.
	Transcript show: '',  
		[solver solveFromCandidates: candidates] timeToRun; cr.