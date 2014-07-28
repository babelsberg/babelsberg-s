operations
cnGEQ: expr
	"Answer a linear constraint self>=expr with strength=required and weight=1.

	expr 		<ClLinearExpression | ClVariable | Number>
	<answer>	<ClLinearInequality>"

	^ self cnGEQ: expr strength: ClStrength required weight: 1.0