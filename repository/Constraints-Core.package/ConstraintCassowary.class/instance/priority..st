accessing
priority: anObject 
"Ths method should retract all external constraints and re-enable them using the new priority."
	priority := anObject.
	self solver
		ifNotNil: [self removeConstraintsFromSolver.
			self externalConstraints
				do: [:extConstraint | extConstraint strength: anObject asCassowaryStrength].
			self addConstraintsToSolver]