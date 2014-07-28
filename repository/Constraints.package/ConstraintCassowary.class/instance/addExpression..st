accessing
addExpression: aConstraintExpression

	aConstraintExpression isBinaryExpression
		ifTrue: [self addExpression: aConstraintExpression leftSide.
				self addExpression: aConstraintExpression rightSide]
		ifFalse: [self addExternalConstraint: aConstraintExpression externalConstraintExpression].