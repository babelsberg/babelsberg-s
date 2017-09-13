testing
testComplexInequalityConstraintsWithExpressions

	| ex ex2 solver |
	ex := ExampleClass new.
	ex a: 15.
	ex b: 15.
	ex2 := ExampleClass new.
	ex2 a: 5.
	ex2 b: 5.
	solver := ConstraintSolver newCassowarySolver.

	self shouldnt: [[ex a + ex b <= 10] alwaysSolveWith: solver] raise: Error.
	self should: [ex a + ex b <= 10].

	self shouldnt: [[ex2 a + ex2 b >= 10] alwaysSolveWith: solver] raise: Error.
	self should: [ex2 a + ex2 b >= 10].