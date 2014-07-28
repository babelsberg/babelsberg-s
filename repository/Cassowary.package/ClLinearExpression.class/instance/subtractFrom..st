accessing
subtractFrom: aNumber
	"Answer a new ClLinearExpression (aNumber/self)."

	^ self negated + aNumber
