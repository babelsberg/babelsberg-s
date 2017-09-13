testing
testNoConstraintInBlock

	| ex solver |
	ex := ExampleClass new.
	ex a: 21; b: 42.
	solver := ConstraintSolver newCassowarySolver.

	self should: [[ex a = 1 & (ex b = 2). false] alwaysSolveWith: solver] raise: Error.
	self shouldnt: [ex a = 1].
	self shouldnt: [ex b = 2].
	self should: [solver constraints isEmpty].

	self should: [[ex a + ex b] alwaysSolveWith: solver] raise: Error.
	self should: [solver constraints isEmpty].