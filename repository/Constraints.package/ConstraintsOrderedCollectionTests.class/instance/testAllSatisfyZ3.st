testing
testAllSatisfyZ3

	| ex solver |
	ex := ExampleClass new.
	ex collection add: -1; add: 5; add: 0.
	solver := ConstraintSolver newZ3Solver.

	self shouldnt: [[	(ex collection allSatisfy: [:each | each >= 3]) &
					(ex collection noneSatisfy: [:each | each >= 10])] alwaysSolveWith: solver] raise: Error.

	self should: [ex collection allSatisfy: [:each | each >= 3]].
	self should: [ex collection noneSatisfy: [:each | each >= 10]].