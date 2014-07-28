*Cassowary
cnEqual: expr
	"Answer a linear constraint self=expr with strength=required and weight=1.

	expr 		<ClLinearExpression | ClVariable | Number>
	<answer>	<ClLinearEquation>"

	^ self cnEqual: expr strength: ClStrength required weight: 1.0