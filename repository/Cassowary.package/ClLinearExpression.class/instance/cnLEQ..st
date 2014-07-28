accessing
cnLEQ: expr
	"Answer a ClLinearInequality self<=expr with strength=required and weight=1.

	expr	<ClLinearExpression | ClVariable | Number>"

	^ self cnLEQ: expr strength: ClStrength required weight: 1.0