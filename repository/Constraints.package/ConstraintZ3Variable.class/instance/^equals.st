comparing
= x

	| binaryExpr |
	binaryExpr := ConstraintBinaryExpression new
		operator: '=';
		leftSide: self;
		rightSide: x.
	^ binaryExpr