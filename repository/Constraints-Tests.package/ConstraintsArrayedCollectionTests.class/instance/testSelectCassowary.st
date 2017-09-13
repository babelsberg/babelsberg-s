testing
testSelectCassowary

	| ex solver |
	ex := ExampleClass new.
	ex arrayCollection: #(1 -2 0 -5.5).
	solver := ConstraintSolver newCassowarySolver.

	self shouldnt: [[(ex arrayCollection select: [:each | each value <= -1]) allSatisfy: [:each | each = 23]] alwaysSolveWith: solver] raise: Error.

	self should: [(ex arrayCollection select: [:each | each = 23]) size = 2].
	self should: [ex arrayCollection second = 23].
	self should: [ex arrayCollection last = 23].