solving
solveConstraintExpression: aConstraintExpression

	| constraint |
	constraint := ConstraintCassowary new
		priority: ConstraintPriority required;
		solver: ConstraintSolver cassowarySolver;
		yourself.
	aConstraintExpression addExpressionToConstraint: constraint.
	constraint enable.