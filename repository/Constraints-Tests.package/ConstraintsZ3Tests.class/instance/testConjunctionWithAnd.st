testing
testConjunctionWithAnd

	| ex |
	ex := ExampleClass new.

      self shouldnt: [[ex a = 3 and: [ex b = 3]] alwaysSolveWith: ConstraintSolver newZ3Solver] raise: Error.
	self should: [ex a = 3].
	self should: [ex b = 3].