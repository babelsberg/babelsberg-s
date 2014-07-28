accessing
addExpression: aConstraintBinaryExpression

	| exprVar |
	exprVar := ConstraintVariable newZ3VariableFor: 0 withName: 'countExpr'.
	exprVar type: 'Int'.
	exprVariables add: exprVar.
	expressions add: (exprVar between: 0 and: 1).
	expressions add: (aConstraintBinaryExpression = (exprVar = 1)).