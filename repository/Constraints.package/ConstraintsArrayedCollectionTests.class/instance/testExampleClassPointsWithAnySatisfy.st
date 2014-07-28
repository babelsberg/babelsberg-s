testing
testExampleClassPointsWithAnySatisfy

	| ex solver allowed |
	ex := ExampleClass new.
	ex arrayCollection: {ExampleClass new a: 1; b: 0. ExampleClass new a: 2; b: 2. ExampleClass new a: 3; b: 5. ExampleClass new a: 0; b: 6}.
	allowed := {ExampleClass new a: 1; b: 0. ExampleClass new a: 0; b: 1. ExampleClass new a: 0; b: 2. ExampleClass new a: 2; b: 2}.
	solver := ConstraintSolver newZ3Solver.

	self shouldnt: [[ex arrayCollection allSatisfy: [:pt | 
		allowed anySatisfy: [:ea | pt a = ea a value and: [pt b = ea b value]]]] alwaysSolveWith: solver] raise: Error.
	self should: [ex arrayCollection allSatisfy: [:pt | 
		allowed anySatisfy: [:ea | pt a = ea a and: [pt b = ea b]]]].