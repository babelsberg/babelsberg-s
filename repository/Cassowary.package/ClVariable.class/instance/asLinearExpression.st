operations
asLinearExpression
	"Coerce this variable to be a linear expression.

	<answer> 	<ClLinearExpression>"
	| expr |

	expr := ClLinearExpression new.
	expr terms at: self put: 1.0.
	^ expr