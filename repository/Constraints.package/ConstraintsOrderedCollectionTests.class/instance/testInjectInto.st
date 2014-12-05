testing
testInjectInto

	| ex solver |
	ex := ExampleClass new.
	ex collection add: 1; add: 1; add: 2; add: 2; add: 3.
	solver := ConstraintSolver newZ3Solver.

	self shouldnt: [[(ex collection inject: 0 into: [:subTotal :next | next + subTotal]) = 17] alwaysSolveWith: solver] raise: Error.
	self should: [ex collection sum = 17].
	self should: [(ex collection inject: 0 into: [:subTotal :next | next + subTotal]) = 17].