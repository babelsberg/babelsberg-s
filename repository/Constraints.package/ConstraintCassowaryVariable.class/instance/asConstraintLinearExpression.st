accessing
asConstraintLinearExpression

	| expr |
	expr := ConstraintLinearExpression new.
	expr externalExpression: self externalVariable asLinearExpression.
	^ expr