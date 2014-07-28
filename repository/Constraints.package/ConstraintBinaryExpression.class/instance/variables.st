accessing
variables
	
	| vars |
	vars := OrderedCollection new.
	(self leftSide isKindOf: ConstraintVariable) 
		ifTrue: [vars add: self leftSide].
	 (self leftSide isConstraintExpression) 
		ifTrue: [vars addAll: self leftSide variables].

	(self rightSide isKindOf: ConstraintVariable) 
		ifTrue: [vars add: self rightSide].
	(self rightSide isConstraintExpression) 
		ifTrue: [vars addAll: self rightSide variables].

	^ vars