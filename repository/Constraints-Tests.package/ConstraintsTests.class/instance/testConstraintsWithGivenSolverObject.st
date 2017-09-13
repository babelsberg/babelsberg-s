testing
testConstraintsWithGivenSolverObject

	| solver ex |
	ex := ExampleClass new.
	solver := ConstraintSolver newCassowarySolver.

	self shouldnt: [[ex a = 42] alwaysSolveWith: solver] raise: Error.
	self should: [ex a = 42].
	self should: [(ex instVarAt: 1) solver == solver].
	self should: [ex a: 21] raise: ConstraintUnsatisfiableError.