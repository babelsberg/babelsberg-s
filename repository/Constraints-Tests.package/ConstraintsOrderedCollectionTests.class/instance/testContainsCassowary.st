testing
testContainsCassowary
"contains: will constrain the first element."
	| ex solver |
	ex := ExampleClass new.
	ex collection add: 1; add: 2; add: 0.
	solver := ConstraintSolver newCassowarySolver.

	self shouldnt: [[ex collection contains: [:each | each >= 3]] alwaysSolveWith: solver] raise: Error.
	self should: [ex collection contains: [:each | each >= 3]].