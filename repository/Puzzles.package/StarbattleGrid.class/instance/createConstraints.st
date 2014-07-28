solving
createConstraints
	"This method creates all necessary constraints to solve a Starbattle puzzle with Z3."
	solver autoSolve: false.

	"Each row, column and region contains exactly two stars."
	Transcript show: 'milliseconds to create row and coumn constraints: ', [
	(1 to: self rowCount) do: [:index |
		[((self atRow: index) count: [:elem | elem isStar] result: 2) &
		((self atColumn: index) count: [:elem | elem isStar] result: 2)] alwaysSolveWith: solver]]
	timeToRun; cr.

	Transcript show: 'milliseconds to create region constraints: ', [
	self regions do: [:region | [region count: [:elem | elem isStar] result: 2] alwaysSolveWith: solver]]
	timeToRun; cr.

	"Stars cannot touch each other, not even diagonally."
	Transcript show: 'milliseconds to create no touch constraints: ', [
	self do: [:cell | 
		[cell hasNoNeighborStars | cell isStar not] alwaysSolveWith: solver]] timeToRun; cr.

	Transcript show: 'milliseconds to solve the constraints: ', [solver solve] timeToRun; cr.