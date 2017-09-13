testing
testMultipleSolvers

	| ex solver solver2 |
	ex := ExampleClass new.
	solver := ConstraintSolver newCassowarySolver.
	solver2 := ConstraintSolver newCassowarySolver.

	self shouldnt: [[ex a = 42] alwaysSolveWith: solver] raise: Error.
	self should: [ex a = 42].
	self should: [(ex instVarAt: 1) solver == solver].

	self should: [[ex a = 17] alwaysSolveWith: solver2] raise: Error.	"The instance variable already uses another solver."
	self should: [ex a = 42].
	self should: [(ex instVarAt: 1) solver == solver].

	self shouldnt: [[ex b = 17] alwaysSolveWith: solver2] raise: Error.
	self should: [ex b = 17].
	self should: [(ex instVarAt: 2) solver == solver2].

	self should: [[ex a = ex b] alwaysSolveWith: solver] raise: Error.
	self should: [ex a = 42].
	self should: [ex b = 17].