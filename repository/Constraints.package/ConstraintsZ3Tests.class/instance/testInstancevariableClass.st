testing
testInstancevariableClass

	| ex ex2 ex3 |
	ex := ExampleClass new.
	ex a: 23.
	ex b: 24.
	ex2 := ExampleClass new.
	ex2 a: 17.
	ex2 b: 18.
	ex3 := ExampleClass new.
	ex3 a: 41.
	ex3 b: 42.

	self shouldnt: [[(ex a - ex2 b) + ex3 a = (ex b + ex3 b)] alwaysSolveWith: ConstraintSolver newZ3Solver] raise: Error.

	self should: [(ex instVarNamed: 'a') class == ConstraintZ3Variable].
	self should: [(ex instVarNamed: 'b') class == ConstraintZ3Variable].

	self shouldnt: [(ex2 instVarNamed: 'a') class == ConstraintZ3Variable].
	self should: [(ex2 instVarNamed: 'b') class == ConstraintZ3Variable].

	self should: [(ex3 instVarNamed: 'a') class == ConstraintZ3Variable].
	self should: [(ex3 instVarNamed: 'b') class == ConstraintZ3Variable].