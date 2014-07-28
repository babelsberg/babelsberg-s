comparing
+ x

	| expr |
	expr := x asConstraintLinearExpression.
	^ ConstraintLinearExpression new
		externalExpression: self externalExpression + expr externalExpression