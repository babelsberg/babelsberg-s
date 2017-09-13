comparing
/ x
	"This method should return a linear expression. x should be a number or constant. Otherwise, Cassowary raises an error."
	^ self asConstraintLinearExpression / x asConstantConstraintVariable value