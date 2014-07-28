testing
testEqualityVariableAndExpressionWithAddition2
	
	| var21 var42 var23 |

	var23 := 23 asConstraintVariable.
	var21 := 21 asConstraintVariable.
	var42 := 42 asConstraintVariable.

	self shouldnt: [TestUtilities solveConstraintExpression: (var42 = (var21 + var23))] raise: Error.
	self should: [var42 value = (var21 value + var23 value)].

	