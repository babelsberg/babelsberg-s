comparing
<= x

	| expr extConstraint |
	expr := x asConstraintLinearExpression.
	extConstraint := self externalExpression cnLEQ: expr externalExpression.
	^ ConstraintCassowaryExpression new externalConstraintExpression: extConstraint