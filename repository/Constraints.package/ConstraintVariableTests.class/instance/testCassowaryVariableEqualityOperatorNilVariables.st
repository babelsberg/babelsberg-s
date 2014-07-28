testing
testCassowaryVariableEqualityOperatorNilVariables
	
	| varNil varNil2 |
	varNil := ConstraintCassowaryVariable new.
	varNil2 := ConstraintCassowaryVariable new.

	self shouldnt: [TestUtilities solveConstraintExpression: (varNil = varNil2)] raise: Error.	"both values are nil"
	self should: [varNil value clApproxZero].
	self should: [varNil2 value clApproxZero].