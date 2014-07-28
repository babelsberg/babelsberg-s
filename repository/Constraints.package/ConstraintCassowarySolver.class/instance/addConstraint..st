manipulating
addConstraint: aConstraint

	(self constraints includes: aConstraint)
		ifTrue: [Transcript show: 'WARNING - The constraint is already enabled.'; cr. ^ self].

	[aConstraint externalConstraints 
		do: [:extConstraint | self externalSolver addConstraint: extConstraint]] 
	ifError: [ConstraintUnsatisfiableError new signal: 
			'The value cannot be assigned because the constraints are unsatisfiable.'].
	self constraints add: aConstraint.
	self autoSolve ifTrue: [self solve].