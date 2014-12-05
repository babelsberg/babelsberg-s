solving
createConstraints
	"This method creates all necessary constraints to solve a Starbattle puzzle with Z3."
	solver autoSolve: false.

	"The output format for benchmarks is: row/column, region, no touch, solving"
	"Each row, column and region contains exactly two stars."
	Transcript show: '', [
	(1 to: self rowCount) do: [:index |
		[((self atRow: index) count: [:elem | elem isStar] equals: 2) &
		((self atColumn: index) count: [:elem | elem isStar] equals: 2)] alwaysSolveWith: solver]]
	timeToRun, ','.

	Transcript show: '', [
	self regions do: [:region | [region count: [:elem | elem isStar] equals: 2] alwaysSolveWith: solver]]
	timeToRun, ','.

	"Stars cannot touch each other, not even diagonally."
	Transcript show: '', [
	self do: [:cell | 
		[cell hasNoNeighborStars | cell isStar not] alwaysSolveWith: solver]] timeToRun, ','.

	Transcript show: '', [solver solve] timeToRun; cr.