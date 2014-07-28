testing
testCassowaryVariableEqualityOperatorConstants
	
	| const2 const5 |
	const2 := 2 asConstantConstraintVariable.
	const5 := 5 asConstantConstraintVariable.

	self should: [const2 isConstant].
	self should: [const5 isConstant].

	self should: [TestUtilities solveConstraintExpression: (const2 = const5)] raise: ConstraintUnsatisfiableError.