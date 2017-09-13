A ConstraintLinearExpression is linear and it is no equation. So, a ConstraintLinearExpression cannot be used as a constraint. It should get the message <=, = or >= to transform itself into a ConstraintZ3Expression, which is a constraint.

Instance Variables
	externalExpression:		aClLinearExpression
