comparing
raisedTo: x

	^ ConstraintBinaryExpression new
			operator: '^';
			leftSide: self;
			rightSide: x