testing
testCassowaryVariableEqualityOperatorOneVariable3
	
	| var23 |
	var23 := 23 asConstraintVariable.

	self shouldnt: [TestUtilities solveConstraintExpression: (var23 = 47)] raise: Error.
	self should: [var23 value = 47].