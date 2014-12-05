testing
testIncludesAllOf

	| ex solver |
	ex := ExampleClass new.
	ex arrayCollection: #(1 1 2 2 3 4 2 7 5).
	solver := ConstraintSolver newZ3Solver.
	solver variableType: 'Int'.

	"Does not work yet, because (self includes: elem) always constrain the first element of the array."
	self shouldnt: [[ex arrayCollection includesAllOf: (Interval from: 1 to: 9)] alwaysSolveWith: solver] raise: Error.
	self should: [ex arrayCollection includesAllOf: (Interval from: 1 to: 9)].