solving
createConstraints
	"This method creates all necessary constraints to solve an Outside Sum Sudoku puzzle with Z3."
	solver variableType: 'Int'.
	solver autoSolve: false.

	Transcript show: 'milliseconds to create sum constraints: ', [
	self createSumConstraints.]
	timeToRun; cr.

	Transcript show: 'milliseconds to create domain constraints: ', [
	[self allSatisfy: [:val | val between: 1 and: 9]] alwaysSolveWith: solver]
	timeToRun; cr.

	Transcript show: 'milliseconds to create row, column and box constraints: ', [
	(1 to: self rowCount) do: [:index |
		[(self atRow: index) allDifferent &
		(self atColumn: index) allDifferent &
		(self atBox: index) allDifferent] alwaysSolveWith: solver]]
	timeToRun; cr.

	Transcript show: 'milliseconds to solve the sudoku constraints: ', [solver solve] timeToRun; cr; cr.