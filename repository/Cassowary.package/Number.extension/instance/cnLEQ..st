*Cassowary
cnLEQ: expr
	"Answer a linear constraint self<=expr with strength=required and weight=1.

	expr 		<ClLinearExpression | ClVariable | Number>
	<answer>	<ClLinearInequality>"

	^ self cnLEQ: expr strength: ClStrength required weight: 1.0