accessing
cnGEQ: expr strength: s weight: w
	"Answer a ClLinearInequality self>=expr with strength s and weight w.

	expr	<ClLinearExpression | ClVariable | Number>
	s		<ClStrength>
	w		<Float>"
	| cn |

	cn := ClLinearInequality new.
	cn expression: self-expr; strength: s; weight: w.
	^ cn
