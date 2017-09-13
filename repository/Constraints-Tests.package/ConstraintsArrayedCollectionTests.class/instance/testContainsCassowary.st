testing
testContainsCassowary
"contains: will constrain the first element."
	| ex solver |
	ex := ExampleClass new.
	ex arrayCollection: #(1 2 0).
	solver := ConstraintSolver newCassowarySolver.

	self shouldnt: [[ex arrayCollection contains: [:each | each >= 3]] alwaysSolveWith: solver] raise: Error.
	self should: [ex arrayCollection contains: [:each | each >= 3]].