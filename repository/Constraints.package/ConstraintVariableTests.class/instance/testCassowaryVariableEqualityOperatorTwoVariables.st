testing
testCassowaryVariableEqualityOperatorTwoVariables
	
	| var17 var23 varTest |
	var17 := ConstraintVariable newCassowaryVariableFor: 17.
	var23 := 23 asConstraintVariable.
	varTest := 'test' asConstraintVariable.

	self shouldnt: [TestUtilities solveConstraintExpression: (var17 = var23)] raise: Error.	"values different, notNil"
	self should: [var17 value = var23 value].
	self should: [TestUtilities solveConstraintExpression: (var17 = varTest)] raise: Error.	"different variable types"