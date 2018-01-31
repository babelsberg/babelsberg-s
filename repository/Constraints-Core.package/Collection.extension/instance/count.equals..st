*Constraints-Core
count: aBlock equals: aNumber
	"This method should return a ConstraintCountExpression."
	| countExpr constraint |
	self isConstructingConstraint ifFalse: [^ (self count: aBlock) = aNumber].
	
	self currentConstraintSolver isCassowarySolver
		ifTrue: [ConstraintUnsatisfiableError new signal: 'Can only create count expressions with Z3.'].

	constraint := self currentConstraint.
	countExpr := ConstraintCountExpression new.
	self do: [:elem |
		aBlock runInConstructionModeWithConstraint: constraint andArgs: (Array with: elem).
		countExpr addExpression: constraint expressions removeLast].
	^ countExpr = aNumber
