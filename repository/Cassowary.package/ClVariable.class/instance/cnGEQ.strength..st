operations
cnGEQ: expr strength: s
	"Answer a linear constraint self>=expr of strength s and weight=1.

	expr 		<ClLinearExpression | ClVariable | Number>
	s 			<ClStrength>
	<answer>	<ClLinearInequality>"

	^ self cnGEQ: expr strength: s weight: 1.0