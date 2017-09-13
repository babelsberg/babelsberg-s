testing
testCassowaryVariableEqualityOperatorTwoVariables2
	
	| var23 varNil |
	var23 := 23 asConstraintVariable.
	varNil := ConstraintCassowaryVariable new.

	self shouldnt: [TestUtilities solveConstraintExpression: (var23 = varNil)] raise: Error. 	"varNil2 value isNil"
	self should: [var23 value = varNil value].