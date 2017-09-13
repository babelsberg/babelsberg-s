testing
testBoolConstraint

	| ex ex2 solver |
	ex := ExampleClass new.
	ex2 := ExampleClass new.
	solver := ConstraintSolver newZ3Solver.

	self shouldnt: [[(ex a = ex b) = (ex2 a = ex2 b)] alwaysSolveWith: solver] raise: Error.
	self should: [(ex a = ex b) & (ex2 a = ex2 b) or: [(ex a ~= ex b) & (ex2 a ~= ex2 b)]].
	self should: [solver constraints size = 1].
	self should: [solver constraints first expressions size = 1].

	self shouldnt: [ex a: 21] raise: Error.
	self should: [(ex a = ex b) & (ex2 a = ex2 b) or: [(ex a ~= ex b) & (ex2 a ~= ex2 b)]].
	self should: [ex a = 21].

	self shouldnt: [[(ex a = ex b) = false] alwaysSolveWith: solver] raise: Error.
	self should: [ex a ~= ex b].