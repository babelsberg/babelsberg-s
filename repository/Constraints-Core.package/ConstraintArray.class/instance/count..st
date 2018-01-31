enumerating
count: aBlock
	"This method should return a ConstraintCountExpression, it may call super count: aBlock result: ?."
	| countExpr constraint |
	self isConstructingConstraint ifFalse: [^ super count: aBlock].

	self currentConstraintSolver isCassowarySolver
		ifTrue: [ConstraintUnsatisfiableError new signal: 'Can only create count expressions with Z3.'].
	constraint := self currentConstraint.
	countExpr := ConstraintCountExpression new.
	1 to: self size do: [:index | | expr | 
		expr := aBlock runInConstructionModeWithConstraint: constraint andArgs: (Array with: (self at: index)).
		countExpr addExpression: constraint expressions removeFirst].
	^ countExpr
