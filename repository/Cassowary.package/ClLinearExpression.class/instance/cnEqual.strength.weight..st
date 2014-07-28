accessing
cnEqual: expr strength: s weight: w
	"Answer a ClLinearEquation self=expr with strength s and weight w.

	expr	<ClLinearExpression | ClVariable | Number>
	s		<ClStrength>
	w		<Float>"
	| cn |

	cn := ClLinearEquation new.
	cn expression: self-expr; strength: s; weight: w.
	^ cn
