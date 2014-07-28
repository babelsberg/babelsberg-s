testing
testInequality

	| ex ex2 solver |
	ex := ExampleClass new.
	ex a: 15.
	ex b: 15.
	ex2 := ExampleClass new.
	ex2 a: 15.
	ex2 b: 15.
	solver := ConstraintSolver newZ3Solver.

	self shouldnt: [[ex a <= 10] alwaysSolveWith: solver] raise: Error.
	self should: [ex a <= 10].

	self shouldnt: [ex a: 7] raise: Error.
	self should: [ex a = 7].

	self should: [ex a: 17] raise: ConstraintUnsatisfiableError.
	self should: [ex a = 7].

	self shouldnt: [[ex2 a < 10] alwaysSolveWith: solver] raise: Error.
	self should: [ex2 a < 10].

	self shouldnt: [ex2 a: 7] raise: Error.
	self should: [ex2 a = 7].

	self should: [ex2 a: 17] raise: ConstraintUnsatisfiableError.
	self should: [ex2 a = 7].

	self shouldnt: [[ex b >= 20] alwaysSolveWith: solver] raise: Error.
	self should: [ex b >= 20].

	self shouldnt: [ex b: 27] raise: Error.
	self should: [ex b = 27].

	self should: [ex b: 17] raise: ConstraintUnsatisfiableError.
	self should: [ex b = 27].

	self shouldnt: [[ex2 b > 20] alwaysSolveWith: solver] raise: Error.
	self should: [ex2 b > 20].

	self shouldnt: [ex2 b: 27] raise: Error.
	self should: [ex2 b = 27].

	self should: [ex2 b: 17] raise: ConstraintUnsatisfiableError.
	self should: [ex2 b = 27].