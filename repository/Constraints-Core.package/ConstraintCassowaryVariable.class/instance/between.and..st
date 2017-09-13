comparing
between: start and: stop

	| firstExpr secondExpr |
	firstExpr := self asConstraintLinearExpression >= start.
	secondExpr := self asConstraintLinearExpression <= stop.
	^ ConstraintBinaryExpression new
		operator: 'and';
		leftSide: firstExpr;
		rightSide: secondExpr