comparing
between: start and: stop

	| firstExpr secondExpr |
	firstExpr := ConstraintBinaryExpression new
		operator: '>=';
		leftSide: self;
		rightSide: start.
	secondExpr := ConstraintBinaryExpression new
		operator: '<=';
		leftSide: self;
		rightSide: stop.
	^ ConstraintBinaryExpression new
		operator: 'and';
		leftSide: firstExpr;
		rightSide: secondExpr