testing
testMultiplication
	
	| var17 var23 expr expr2 var21 |
	var17 := 17 asConstraintVariable.
	var21 := 21 asConstraintVariable.
	var23 := 23 asConstantConstraintVariable.

	self should: [(var17 * var23) class == ConstraintLinearExpression].
	self should: [(var17 * 3) class == ConstraintLinearExpression].

	expr := 9 asConstraintVariable * 13 asConstantConstraintVariable.
	self should: [(expr * var23) class == ConstraintLinearExpression].
	self should: [(expr * 3) class == ConstraintLinearExpression].

	expr2 := 42 asConstraintVariable * 3.
	self should: [(expr2 * var23) class == ConstraintLinearExpression].
	self should: [(expr2 * 5) class == ConstraintLinearExpression].

	self should: [expr * expr2] raise: Error.
	self should: [var17 * var21] raise: Error.
	self should: [expr * var21] raise: Error.
	self should: [var17 * expr2] raise: Error.

	self shouldnt: [TestUtilities solveConstraintExpression: (var17 * 3 = 42)] raise: Error.
	self should: [var17 value * 3 = 42].