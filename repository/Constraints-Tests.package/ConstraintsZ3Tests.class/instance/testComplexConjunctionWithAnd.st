testing
testComplexConjunctionWithAnd

	| pt1 pt2 |
	pt1 := ExampleClass new.
	pt1 a: 20; b: 20.
	pt2 := ExampleClass new.
	pt2 a: 10; b: 10.

      self shouldnt: [[pt1 a = pt2 a and: [pt1 b = pt2 b]] alwaysSolveWith: ConstraintSolver newZ3Solver] raise: Error.
	self should: [pt1 a = pt2 a].
	self should: [pt1 b = pt2 b].