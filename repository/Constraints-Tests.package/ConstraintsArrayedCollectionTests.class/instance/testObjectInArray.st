testing
testObjectInArray

	| ex solver obj1 obj2 obj3 |
	ex := ExampleClass new.
	obj1 := ExampleClass new.
	obj2 := ExampleClass new.
	obj3 := ExampleClass new.
	ex arrayCollection: (Array new: 6).
	ex arrayCollection at: 1 put: obj1.
	ex arrayCollection at: 2 put: obj2.
	ex arrayCollection at: 3 put: 17.
	ex arrayCollection at: 4 put: obj3.
	ex arrayCollection at: 5 put: nil.
	ex arrayCollection at: 6 put: #(1 2 3).
	solver := ConstraintSolver newZ3Solver.

	self shouldnt: [[ex arrayCollection first a = 5] alwaysSolveWith: solver] raise: Error.
	self should: [ex arrayCollection first a = 5].
	self should: [ex arrayCollection class == ConstraintArray].
	self should: [(ex arrayCollection first instVarNamed: 'a') isZ3Variable].
	self shouldnt: [(ex arrayCollection first instVarNamed: 'b') isConstraintVariable].

	self shouldnt: [(ex arrayCollection second instVarNamed: 'a') isConstraintVariable].
	self shouldnt: [(ex arrayCollection atWrap: 3) isConstraintVariable].
	self shouldnt: [(ex arrayCollection fourth instVarNamed: 'a') isConstraintVariable].
	self should: [ex arrayCollection fifth = nil].
	self shouldnt: [(ex arrayCollection at: 6) class == ConstraintArray].

	self should: [(ex arrayCollection at: 2) == obj2].
	self shouldnt: [ex arrayCollection at: 3 put: 42] raise: Error.
	self shouldnt: [ex arrayCollection at: 2 put: obj3] raise: Error.
	self shouldnt: [(ex arrayCollection at: 4) a = 3] raise: Error.