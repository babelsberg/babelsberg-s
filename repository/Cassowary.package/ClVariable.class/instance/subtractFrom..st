operations
subtractFrom: aNumber
	"Answer a new linear expression (aNumber-self).

	<answer> <ClLinearExpression>"

	^ self negated + aNumber