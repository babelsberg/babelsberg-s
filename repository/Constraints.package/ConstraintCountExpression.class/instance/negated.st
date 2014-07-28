as yet unclassified
negated

	resultExpression ifNil: [self error: 'Cannot negate a constraint count expression without result.'].
	resultExpression := (resultExpression = false).