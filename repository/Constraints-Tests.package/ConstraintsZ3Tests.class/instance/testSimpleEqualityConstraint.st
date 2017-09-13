testing
testSimpleEqualityConstraint

	| ex solver |
	ex := ExampleClass new.
	solver := ConstraintSolver newZ3Solver.
	self shouldnt: [[ex a = 42] alwaysSolveWith: solver] raise: Error.
	self should: [(ex instVarAt: 1) class == ConstraintZ3Variable].
	self should: [(ex instVarAt: 1) solver == solver].
	self should: [(ex instVarAt: 1) varName = 'a'].
	self should: [ex a = 42].

	self should: [ex a: 21] raise: ConstraintUnsatisfiableError.