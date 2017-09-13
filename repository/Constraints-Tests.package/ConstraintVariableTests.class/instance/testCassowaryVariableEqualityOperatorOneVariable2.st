testing
testCassowaryVariableEqualityOperatorOneVariable2
	
	| const2 varNil |
	varNil := ConstraintCassowaryVariable new.
	const2 := 2 asConstantConstraintVariable.

	self shouldnt: [TestUtilities solveConstraintExpression: (varNil = const2)] raise: Error.	"varNil value isNil"	
	self should: [varNil value = const2 value].