as yet unclassified
anySatisfy: aBlock

	| orExpr constraint |
	Processor activeProcess isConstructingConstraint
		ifTrue: [
			constraint := (Processor activeProcess environmentAt: #constraintObject).
			constraint solver isCassowarySolver
				ifTrue: ["Cassowary has no or expressions, so call super and create a constraint." 
						^ super anySatisfy: aBlock].
			orExpr := ConstraintBinaryExpression new leftSide: false; rightSide: false; operator: 'and'.
			self do: [:elem |
				aBlock runInConstructionModeWithConstraint: constraint andArgs: (Array with: elem).
				orExpr := orExpr | constraint expressions removeLast].
			^ orExpr]
		ifFalse: [^ super anySatisfy: aBlock].