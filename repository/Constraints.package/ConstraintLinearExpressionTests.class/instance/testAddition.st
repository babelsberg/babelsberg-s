testing
testAddition
 
	| var17 var23 expr expr2 |
	var17 := 17 asConstraintVariable.
	var23 := 23 asConstraintVariable.

	self should: [(var17 + var23) class == ConstraintLinearExpression].

	expr := 9 asConstraintVariable + 13 asConstraintVariable.
	self should: [(expr + var17) class == ConstraintLinearExpression].
	self should: [(var17 + expr) class == ConstraintLinearExpression].

	expr2 := 42 asConstraintVariable + 21 asConstraintVariable.
	self should: [(expr + expr2) class == ConstraintLinearExpression].

	self should: [(var17 + 2) class == ConstraintLinearExpression].

	self shouldnt: [TestUtilities solveConstraintExpression: (var23 + var17 = 42)] raise: Error.
	self should: [var23 value + var17 value = 42].