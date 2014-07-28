testing
testConstraintObject

	| ex ex2 ex3 solver |
	ex := ExampleClass new.
	ex2 := ExampleClass new.
	ex3 := ExampleClass new.
	solver := ConstraintSolver newZ3Solver.

	self should: [([(ex a - ex2 b) + ex3 a = (ex2 a - (ex b + ex3 b))] alwaysSolveWith: solver) class == ConstraintZ3].
	self should: [([(ex a - ex2 b) * 3 = (ex2 a * 2 + (ex b - ex3 a * (-4)))] alwaysSolveWith: solver) class == ConstraintZ3].
	self should: [([(ex a - ex2 b) / 3.0 = (ex2 a / 2.0 + (ex b - ex3 a / (-4.0)))] alwaysSolveWith: solver) class == ConstraintZ3].