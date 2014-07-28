comparing
& aConstraintExpression
	"The argument should evaluate to a boolean, so it must be a constraint expression."
	aConstraintExpression isConstraintExpression
		ifFalse: [self error: 'Cannot conjugate a constraint expression with something else than a constraint expression.'].
	^ ConstraintBinaryExpression new
			operator: 'and';
			leftSide: self;
			rightSide: aConstraintExpression