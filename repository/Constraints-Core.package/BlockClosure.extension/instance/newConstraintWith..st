*Constraints-Core
newConstraintWith: aConstraintSolver

	^  aConstraintSolver constraintClass new
		constraintBlock: self;
		priority: ConstraintPriority required;
		solver: aConstraintSolver;
		yourself.