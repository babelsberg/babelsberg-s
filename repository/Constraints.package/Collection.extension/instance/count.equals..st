*Constraints-Core
count: aBlock equals: aNumber
	"This method should return a ConstraintCountExpression."
	| countExpr constraint |
	Processor activeProcess isConstructingConstraint
		ifTrue: [
			constraint := (Processor activeProcess environmentAt: #constraintObject).
			constraint solver isCassowarySolver
				ifTrue: [ConstraintUnsatisfiableError new signal: 'Can only create count expressions with Z3.'].
			countExpr := ConstraintCountExpression new.
			self do: [:elem |
				aBlock runInConstructionModeWithConstraint: constraint andArgs: (Array with: elem).
				countExpr addExpression: constraint expressions removeLast].
			^ countExpr = aNumber]
		ifFalse: [^ (self count: aBlock) = aNumber].