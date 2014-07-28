testing
testObjectInOrderedCollectionCassowary

	| ex solver obj1 obj2 obj3 |
	ex := ExampleClass new.
	obj1 := ExampleClass new.
	obj2 := ExampleClass new.
	obj3 := ExampleClass new.
	ex collection add: obj1.
	ex collection add: obj2.
	ex collection add: 17.
	ex collection add: obj3.
	ex collection add: nil.
	ex collection add: #(1 2 3).
	solver := ConstraintSolver newCassowarySolver.

	self shouldnt: [[ex collection first a = 5] alwaysSolveWith: solver] raise: Error.
	self should: [ex collection first a = 5].
	self should: [(ex collection first instVarNamed: 'a') isCassowaryVariable].
	self shouldnt: [(ex collection first instVarNamed: 'b') isConstraintVariable].

	self shouldnt: [(ex collection second instVarNamed: 'a') isConstraintVariable].
	self shouldnt: [(ex collection fourth instVarNamed: 'a') isConstraintVariable].
	self should: [ex collection fifth = nil].
	self shouldnt: [(ex collection at: 6) class == ConstraintArray].

	self should: [(ex collection at: 2) == obj2].
	self shouldnt: [ex collection at: 3 put: 42] raise: Error.
	self shouldnt: [ex collection at: 2 put: obj3] raise: Error.
	self shouldnt: [(ex collection at: 4) a = 3] raise: Error.