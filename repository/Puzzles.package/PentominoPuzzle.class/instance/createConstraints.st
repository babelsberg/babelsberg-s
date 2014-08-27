as yet unclassified
createConstraints
	"This method creates all necessary constraints to solve a Starbattle puzzle with Z3."
	solver autoSolve: false.
	solver variableType: 'Int'.

	Transcript show: 'milliseconds to create domain constraints for all points: ', [
	[self allPoints allSatisfy: [:point | 
		(point x between: 1 and: self rowCount value) &
		(point y between: 1 and: self columnCount value)]] alwaysSolveWith: solver] 
	timeToRun; cr.

	Transcript show: 'milliseconds to create allDifferent constraint for all points: ', [
	[self allPoints allDifferent] alwaysSolveWith: solver]
	timeToRun; cr.

	Transcript show: 'milliseconds to create constraints for all pentominoes: ', [
	self pentominoNames do: [:character | 
		[self containsPentomino: character] alwaysSolveWith: solver]]
	timeToRun; cr.

	Transcript show: 'milliseconds to solve the constraints: ', [solver solve] timeToRun; cr; cr.