accessing
divFrom: aNumber
	"Answer a new ClLinearExpression (aNumber/self).  Since the result must be linear, this is permissible only if self is a constant."

	self isConstant ifTrue: [^ aNumber / self constant].
	ClError nonlinear signal "result would be non-linear"