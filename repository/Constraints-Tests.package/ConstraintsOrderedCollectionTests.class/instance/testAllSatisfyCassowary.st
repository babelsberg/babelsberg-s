testing
testAllSatisfyCassowary

	| ex solver |
	ex := ExampleClass new.
	ex collection add: 1; add: 2; add: 0.
	solver := ConstraintSolver newCassowarySolver.

	self shouldnt: [[ex collection allSatisfy: [:each | each >= 3]] alwaysSolveWith: solver] raise: Error.

	self should: [ex collection first >= 3].
	self should: [ex collection second >= 3].
	self should: [ex collection third >= 3].