testing
testAnySatisfyZ3
"anySatisfy: will constrain the first element."
	| ex solver |
	ex := ExampleClass new.
	ex a: 17.
	ex arrayCollection: #(1 2 3 4).
	solver := ConstraintSolver newZ3Solver.

	self shouldnt: [[ex arrayCollection anySatisfy: [:each | ex a = each value]] alwaysSolveWith: solver] raise: Error.
	self should: [ex arrayCollection anySatisfy: [:each | ex a = each value]].

	self shouldnt: [[ex a = 3] alwaysSolveWith: solver] raise: Error.