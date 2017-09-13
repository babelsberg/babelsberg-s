testing
testVariableTypeOnSolver

	| ex solver |
	ex := ExampleClass new.
	ex arrayCollection: #(1.5 2.0 3.7).
	solver := ConstraintSolver newZ3Solver.

	self shouldnt: [[ex arrayCollection allDifferent] alwaysSolveWith: solver] raise: Error.
	self should: [ex arrayCollection asSet size = 3].
	self should: [ex arrayCollection allSatisfy: [:each | each isFloat]].

	solver variableType: 'Int'.
	self should: [ex arrayCollection asSet size = 3].
	self should: [ex arrayCollection allSatisfy: [:each | each isInteger]].

	solver variableType: 'Real'.
	self should: [ex arrayCollection asSet size = 3].
	self should: [ex arrayCollection allSatisfy: [:each | each isFloat]].

	self shouldnt: [[ex arrayCollection first isInteger] alwaysSolveWith: solver] raise: Error.
	self should: [ex arrayCollection asSet size = 3].
	self should: [ex arrayCollection first isInteger].