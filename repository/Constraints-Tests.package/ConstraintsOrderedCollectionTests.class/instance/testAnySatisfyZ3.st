testing
testAnySatisfyZ3
"anySatisfy: will constrain the first element."
	| ex solver |
	ex := ExampleClass new.
	ex collection add: 1; add: 2; add: 0.
	solver := ConstraintSolver newZ3Solver.

	self shouldnt: [[ex collection anySatisfy: [:each | each >= 3]] alwaysSolveWith: solver] raise: Error.
	self should: [ex collection anySatisfy: [:each | each >= 3]].

	"It should be possible to change the constrained (first) element, if there are other elements that could fulfil the constraint. That is not possible, yet."
	"self shouldnt: [ex collection at: 1 put: 2] raise: Error.
	self should: [ex collection anySatisfy: [:each | each >= 3]]."