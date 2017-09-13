testing
testPower

	| ex ex2 ex3 solver |
	ex := ExampleClass new.
	ex2 := ExampleClass new.
	ex3 := ExampleClass new.
	solver := ConstraintSolver newZ3Solver.

	self shouldnt: [[(ex a raisedTo: 2) = 9] alwaysSolveWith: solver] raise: Error.
	self should: [(ex a raisedTo: 2) = 9].
	self should: [ex a = 3].

	self shouldnt: [[(ex b raisedToInteger: 3) = 8] alwaysSolveWith: solver] raise: Error.
	self should: [(ex b raisedToInteger: 3) = 8].
	self should: [ex b = 2].

	self shouldnt: [[ex2 a squared = 16] alwaysSolveWith: solver] raise: Error.
	self should: [ex2 a squared = 16].
	self should: [ex2 a = 4 or: [ex2 a = -4]].

	self shouldnt: [[((ex3 a + ex3 b) squared) = 25] alwaysSolveWith: solver] raise: Error.
	self should: [((ex3 a + ex3 b) raisedTo: 2) = 25].