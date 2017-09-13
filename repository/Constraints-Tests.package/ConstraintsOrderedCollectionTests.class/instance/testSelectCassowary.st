testing
testSelectCassowary
"This test fails because select already creates constraint expression instead of selecting the CVs."
	| ex solver |
	ex := ExampleClass new.
	ex collection add: 1; add: -2; add: 0; add: -5.5.
	solver := ConstraintSolver newCassowarySolver.

	self shouldnt: [[(ex collection select: [:each | each value <= -1]) allSatisfy: [:each | each = 23]] alwaysSolveWith: solver] raise: Error.

	self should: [(ex collection select: [:each | each = 23]) size = 2].
	self should: [ex collection second = 23].
	self should: [ex collection last = 23].