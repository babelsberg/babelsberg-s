as yet unclassified
anySatisfy: aBlock

	| orExpr constraint |
	(self isConstructingConstraint not or: [	
		self currentConstraintSolver isCassowarySolver
		"Cassowary has no or expressions"]) 
			ifTrue: [^ super anySatisfy: aBlock].

	constraint :=self currentConstraint.
	orExpr := ConstraintBinaryExpression new leftSide: false; rightSide: false; operator: 'and'.
	self do: [:elem |
		aBlock runInConstructionModeWithConstraint: constraint andArgs: (Array with: elem).
		orExpr := orExpr | constraint expressions removeLast].
	^ orExpr
