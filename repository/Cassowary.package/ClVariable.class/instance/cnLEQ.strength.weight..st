operations
cnLEQ: expr strength: s weight: w
	"Answer a linear constraint self<=expr of strength s and weight w.

	expr 		<ClLinearExpression | ClVariable | Number>
	s 			<ClStrength>
	w 			<Float>
	<answer>	<ClLinearEquation>"
	| cn |
	
	cn := ClLinearInequality new.
	cn 
		expression: expr asLinearExpression - self asLinearExpression; 
		strength: s; 
		weight: w.
	^ cn