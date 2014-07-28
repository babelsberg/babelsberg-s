accessing
suggestValue: aValue
"This method adds an equality constraint for the new value. If all constraints are still solvable, the value is changed to aValue. Otherwise, the old value does not change and an exception is raised."
	| tmpExpr tmpConstraint |
	(self value = aValue)
		ifTrue: [^ self].	

	tmpExpr := ConstraintBinaryExpression new
		operator: '=';
		leftSide: self;
		rightSide: aValue.
	tmpConstraint := ConstraintZ3 new 
		addExpression: tmpExpr;
		solver: self solver.
	[tmpConstraint 	addConstraintsToSolver] 
		ifError: [tmpConstraint removeConstraintsFromSolver.
				ConstraintUnsatisfiableError new 
					signal: 'The value cannot be assigned because the constraints are unsatisfiable.'].
	tmpConstraint removeConstraintsFromSolver.