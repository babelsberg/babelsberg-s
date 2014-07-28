testing
testConjunctionChain

	| ex ex2 solver |
	ex := ExampleClass new.
	ex2 := ExampleClass new.
	solver := ConstraintSolver newZ3Solver.

	self shouldnt: [[ex a = 1 & (ex b = 2) & (ex2 a = 3) & (ex2 b = 4)] alwaysSolveWith: solver] raise: Error.
	self should: [ex a = 1].
	self should: [ex b = 2].
	self should: [ex2 a = 3].
	self should: [ex2 b = 4].

	self should: [solver constraints size = 1].

	self should: [ex a: 21] raise: ConstraintUnsatisfiableError.
	self should: [ex b: 21] raise: ConstraintUnsatisfiableError.
	self should: [ex2 a: 21] raise: ConstraintUnsatisfiableError.
	self should: [ex2 b: 21] raise: ConstraintUnsatisfiableError.