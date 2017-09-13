testing
testNoneSatisfyZ3

	| ex solver |
	ex := ExampleClass new.
	ex arrayCollection: #(17 3 0).
	solver := ConstraintSolver newZ3Solver.

	self shouldnt: [[ex arrayCollection noneSatisfy: [:each | each >= 3]] alwaysSolveWith: solver] raise: Error.

	self should: [ex arrayCollection first < 3].
	self should: [ex arrayCollection second < 3].
	self should: [ex arrayCollection third < 3].

	self should: [ex arrayCollection at: 1 put: 5] raise: ConstraintUnsatisfiableError.