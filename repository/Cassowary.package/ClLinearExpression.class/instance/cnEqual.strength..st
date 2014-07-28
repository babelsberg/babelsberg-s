accessing
cnEqual: expr strength: s
	"Answer a ClLinearEquation self=expr with strength s and weight=1.

	expr	<ClLinearExpression | ClVariable | Number>
	s		<ClStrength>"

	^ self cnEqual: expr strength: s weight: 1.0