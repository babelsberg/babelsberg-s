testing
testAllSatisfyCassowary

	| ex solver |
	ex := ExampleClass new.
	ex arrayCollection: #(1 2 0).
	solver := ConstraintSolver newCassowarySolver.

	self shouldnt: [[ex arrayCollection allSatisfy: [:each | each >= 3]] alwaysSolveWith: solver] raise: Error.

	self should: [ex arrayCollection first >= 3].
	self should: [ex arrayCollection second >= 3].
	self should: [ex arrayCollection third >= 3].