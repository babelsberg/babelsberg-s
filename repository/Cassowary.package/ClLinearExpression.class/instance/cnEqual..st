accessing
cnEqual: expr
	"Answer a ClLinearEquation self=expr with strength=required and weight=1.

	expr	<ClLinearExpression | ClVariable | Number>"

	^ self cnEqual: expr strength: ClStrength required weight: 1.0