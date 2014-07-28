comparing
| x

	^ ConstraintBinaryExpression new
			operator: 'or';
			leftSide: self;
			rightSide: x