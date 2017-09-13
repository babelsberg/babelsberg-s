comparing
& x

	^ ConstraintBinaryExpression new
			operator: 'and';
			leftSide: self;
			rightSide: x