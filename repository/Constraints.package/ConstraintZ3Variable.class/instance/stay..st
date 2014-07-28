comparing
stay: aConstraintPriority

	| constraint |
	self stayConstraint ifNotNil: [^ self].
	constraint := ConstraintZ3 new
					priority: aConstraintPriority;
					solver: self solver;
					addExpression: self = self value;
					yourself.
	[constraint 	addConstraintsToSolver] 
		ifError: [constraint removeConstraintsFromSolver.
				ConstraintUnsatisfiableError new 
					signal: 'It is not possible to add a stay constraint with the given priority.'].
	self stayConstraint: constraint.