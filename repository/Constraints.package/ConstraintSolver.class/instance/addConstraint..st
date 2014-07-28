manipulating
addConstraint: aConstraint

	(self constraints includes: aConstraint)
		ifTrue: [Transcript show: 'WARNING - The constraint is already enabled.'; cr. ^ self].
	self constraints add: aConstraint.
	self autoSolve ifTrue: [[self solve] ifError: [self constraints remove: aConstraint. ConstraintUnsatisfiableError new signal]].