testing
testNoneSatisfyCassowary
"Creates a negated expression (expr = false), but Cassowary cannot not solve them."
	| ex solver |
	ex := ExampleClass new.
	ex collection add: 17; add: 3; add: 0.
	solver := ConstraintSolver newCassowarySolver.

	self should: [[ex collection noneSatisfy: [:each | each >= 3]] alwaysSolveWith: solver] raise: Error.