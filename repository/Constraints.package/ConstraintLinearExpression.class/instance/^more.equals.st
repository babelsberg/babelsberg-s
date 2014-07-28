comparing
>= x

	| expr extConstraint |
	expr := x asConstraintLinearExpression.
	extConstraint := self externalExpression cnGEQ: expr externalExpression.
	^ ConstraintCassowaryExpression new externalConstraintExpression: extConstraint