enumerating
count: aBlock
	"This method should return a ConstraintCountExpression, it may call super count: aBlock result: ?."
	| countExpr constraint |
	Processor activeProcess isConstructingConstraint
		ifTrue: [
			constraint := (Processor activeProcess environmentAt: #constraintObject).
			constraint solver isCassowarySolver
				ifTrue: [ConstraintUnsatisfiableError new signal: 'Can only create count expressions with Z3.'].
			countExpr := ConstraintCountExpression new.
			1 to: self size do: [:index | | expr | 
				expr := aBlock runInConstructionModeWithConstraint: constraint andArgs: (Array with: (self at: index)).
				countExpr addExpression: constraint expressions removeFirst].
			^ countExpr]
		ifFalse: [^ super count: aBlock].