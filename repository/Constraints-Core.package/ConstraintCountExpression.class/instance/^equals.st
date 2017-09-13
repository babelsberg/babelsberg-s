comparing
= aNumber

	aNumber isNumber ifFalse: [ConstraintUnsatisfiableError new signal: 'Can only create count expressions that equals a number.'].
	resultExpression := exprVariables sum = aNumber.