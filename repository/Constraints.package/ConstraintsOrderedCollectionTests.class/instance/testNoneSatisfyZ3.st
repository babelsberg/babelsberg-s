testing
testNoneSatisfyZ3

	| ex solver |
	ex := ExampleClass new.
	ex collection add: 17; add: 3; add: 0.
	solver := ConstraintSolver newZ3Solver.

	self shouldnt: [[ex collection noneSatisfy: [:each | each >= 3]] alwaysSolveWith: solver] raise: Error.

	self should: [ex collection first < 3].
	self should: [ex collection second < 3].
	self should: [ex collection third < 3].

	self should: [ex collection at: 1 put: 5] raise: ConstraintUnsatisfiableError.