accessing
cnGEQ: expr strength: s
	"Answer a ClLinearInequality self>=expr with strength s and weight=1.

	expr	<ClLinearExpression | ClVariable | Number>
	s		<ClStrength>"

	^ self cnGEQ: expr strength: s weight: 1.0