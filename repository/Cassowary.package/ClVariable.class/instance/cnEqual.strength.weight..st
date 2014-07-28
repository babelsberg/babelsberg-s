operations
cnEqual: expr strength: s weight: w
	"Answer a linear constraint self=expr of strength s and weight w.

	expr 		<ClLinearExpression | ClVariable | Number>
	s 			<ClStrength>
	w 			<Float>
	<answer>	<ClLinearEquation>"
	| cn |

	cn := ClLinearEquation new.
	cn 
		expression: self-expr; 
		strength: s; 
		weight: w.
	^ cn