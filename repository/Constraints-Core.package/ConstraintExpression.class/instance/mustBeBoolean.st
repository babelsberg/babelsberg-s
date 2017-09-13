converting
mustBeBoolean
	"mustBeBoolean is called in ccm, when an early return is used, e.g. in allSatisfy. We always assume that the expression is satisfiable and therefore return true."
	self addExpressionToConstraint: (Processor activeProcess environmentAt: #constraintObject).
	^ true