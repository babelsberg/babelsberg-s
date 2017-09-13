comparing
= x

	| expr extConstraint |
	expr := x asConstraintLinearExpression.
	extConstraint := self externalExpression cnEqual: expr externalExpression.
	^ ConstraintCassowaryExpression new externalConstraintExpression: extConstraint