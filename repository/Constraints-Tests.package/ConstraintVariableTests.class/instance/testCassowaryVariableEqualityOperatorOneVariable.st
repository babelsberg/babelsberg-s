testing
testCassowaryVariableEqualityOperatorOneVariable
	
	| const2 var17 varTest |
	var17 := ConstraintVariable newCassowaryVariableFor: 17.
	varTest := 'test' asConstraintVariable.
	const2 := 2 asConstantConstraintVariable.

	self should: [var17 isCassowaryVariable].
	self shouldnt: [varTest isCassowaryVariable].

	self shouldnt: [TestUtilities solveConstraintExpression: (var17 = const2)] raise: Error.	"var17 value notNil"
	self should: [var17 value = const2 value].