accessing
suggestValue: aValue

	| extConstraint tmpConstraint |
	extConstraint := self externalVariable cnEqual: aValue.
	tmpConstraint := ConstraintCassowary new 
		addExternalConstraint: extConstraint;
		priority: (ConstraintPriority fromCassowaryStrength: extConstraint strength);
		solver: self solver.
	[tmpConstraint 	addConstraintsToSolver] 
		ifError: [ConstraintUnsatisfiableError new 
			signal: 'The value cannot be assigned because the constraints are unsatisfiable.'].
	tmpConstraint removeConstraintsFromSolver.