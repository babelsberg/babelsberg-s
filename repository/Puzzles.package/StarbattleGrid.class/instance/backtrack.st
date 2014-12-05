solving
backtrack

	| candidates |
	candidates := self initialCandidates.
	Transcript show: 'milliseconds to backtrack starbattle ',  
		[solver solveFromCandidates: candidates] timeToRun; cr.