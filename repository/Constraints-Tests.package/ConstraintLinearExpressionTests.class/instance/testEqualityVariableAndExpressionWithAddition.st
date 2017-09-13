testing
testEqualityVariableAndExpressionWithAddition
	
	| var13 var17 var9 |

	var17 := 17 asConstraintVariable.
	var9 := 9 asConstraintVariable.
	var13 := 13 asConstraintVariable.

	self shouldnt: [TestUtilities solveConstraintExpression: (var9 + var13 = var17)] raise: Error.
	self should: [var9 value + var13 value = var17 value].
	