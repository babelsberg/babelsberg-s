manipulation
/ x
	"Answer a new linear expression formed by dividing self by x. (Note that this result must be linear.)"

	| expr |
	expr := x asLinearExpression.
	expr isConstant ifFalse: [ClError nonlinear signal "result would be non-linear"].
	^ self * expr constant reciprocal