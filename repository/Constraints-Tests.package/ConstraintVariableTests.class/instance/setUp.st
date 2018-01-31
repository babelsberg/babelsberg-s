running
setUp
	
	| constraint |
	ConstraintSolver cassowarySolver removeAllConstraints.
	constraint := ConstraintCassowary new
					priority: ConstraintPriority required;
					solver: ConstraintSolver cassowarySolver;
					yourself.
	self currentConstraint: constraint.