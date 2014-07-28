running
setUp
	
	| constraint |
	ConstraintSolver cassowarySolver removeAllConstraints.
	constraint := ConstraintCassowary new
					priority: ConstraintPriority required;
					solver: ConstraintSolver cassowarySolver;
					yourself.
	Processor activeProcess environmentAt: #constraintObject put: constraint.