testing
testCassowaryVariableEqualityOperatorConstants2
	
	| const9 |
	const9 := 9 asConstantConstraintVariable.

	self should: [const9 isConstant].

	self shouldnt: [TestUtilities solveConstraintExpression: (const9 = const9 copy)] raise: Error.