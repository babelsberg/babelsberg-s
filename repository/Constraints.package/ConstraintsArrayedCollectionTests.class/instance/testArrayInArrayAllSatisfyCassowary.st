testing
testArrayInArrayAllSatisfyCassowary

	| ex solver |
	ex := ExampleClass new.
	ex arrayCollection: (Array new: 3).
	ex arrayCollection at: 1 put: #(1 2 3 2 5 3).
	ex arrayCollection at: 2 put: #(1 2 3 3).
	ex arrayCollection at: 3 put: #(1 2 3).
	solver := ConstraintSolver newCassowarySolver.

	self shouldnt: [[ex arrayCollection first allSatisfy: [:each | each >= 3]] alwaysSolveWith: solver] raise: Error.
	self should: [ex arrayCollection first allSatisfy: [:each | each >= 3]].