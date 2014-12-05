solving
createConstraints
	"This method creates all necessary constraints to solve a standard Sudoku puzzle with Z3."
	solver variableType: 'Int'.
	solver autoSolve: false.
	"the output format on the Transcript is: stay, domain, loops, solving" 
	Transcript show: [self addConstraintsForAllGivenNumbers] timeToRun asString, ','.

	Transcript show: [[self allSatisfy: [:val | val between: 1 and: 9]] alwaysSolveWith: solver] timeToRun asString, ','.

	Transcript show: [
	(1 to: self rowCount) do: [:index |
		[(self atRow: index) allDifferent &
		(self atColumn: index) allDifferent &
		(self atBox: index) allDifferent] alwaysSolveWith: solver]]
	timeToRun asString, ','.

	Transcript show: [solver solve] timeToRun; cr.