testing
testVariableTypeOnSolver

	| ex solver |
	ex := ExampleClass new.
	ex collection add: 1.5; add: 2.0; add: 3.7.
	solver := ConstraintSolver newZ3Solver.

	self shouldnt: [[ex collection allDifferent] alwaysSolveWith: solver] raise: Error.
	self should: [ex collection asSet size = 3].
	self should: [ex collection allSatisfy: [:each | each isFloat]].

	solver variableType: #'Int'.
	self should: [ex collection asSet size = 3].
	self should: [ex collection allSatisfy: [:each | each isInteger]].

	self shouldnt: [[ex a = 3.0] alwaysSolveWith: solver] raise: Error.
	self should: [ex a = 3].
	self should: [ex a isInteger].

	solver variableType: #'Real'.
	self should: [ex collection asSet size = 3].
	self should: [ex collection allSatisfy: [:each | each isFloat]].

	self shouldnt: [[ex collection first isInteger] alwaysSolveWith: solver] raise: Error.
	self should: [ex collection asSet size = 3].
	self should: [ex collection first isInteger].