testing
testIndexedConstraint

	| ex solver ex2 |
	ex := ExampleClass new.
	ex collection add: 1.5; add: -2.
	solver := ConstraintSolver newCassowarySolver.
	
	self shouldnt: [[(ex collection at: 1) = 5] alwaysSolveWith: solver] raise: Error.
	self should: [(ex collection at: 1) = 5].
	self should: [ex collection at: 1 put: 100] raise: ConstraintUnsatisfiableError.

	ex2 := ex collection copyFrom: 1 to: 1.
	self should: [ex2 size = 1].
	self should: [(ex2 at: 1) = 5].
	self should: [ex2 at: 1 put: 100] raise: ConstraintUnsatisfiableError.