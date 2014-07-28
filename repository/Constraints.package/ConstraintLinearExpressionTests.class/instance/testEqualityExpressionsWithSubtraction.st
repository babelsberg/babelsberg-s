testing
testEqualityExpressionsWithSubtraction
 
	| var13 var17 var9 var23 |
	var17 := 17 asConstraintVariable.
	var9 := 9 asConstraintVariable.
	var13 := 13 asConstraintVariable.
	var23 := 23 asConstraintVariable.

	self shouldnt: [TestUtilities solveConstraintExpression: ((var17 - var9) = (var23 - var13))] raise: Error.
	self should: [(var17 value - var9 value) = (var23 value - var13 value)].

	