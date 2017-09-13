*Constraints-Core
alwaysSolveWithDebug: aConstraintSolver
	"This is used in the constraint debugger to step into the constraint block"
	| constraint result |
	constraint := aConstraintSolver class constraintClass new
					constraintBlock: self;
					priority: ConstraintPriority required;
					solver: aConstraintSolver;
					yourself.
	Processor activeProcess environmentAt: #constraintObject put: constraint.
	result := self value.
	(result respondsTo: #addExpressionToConstraint:)
		ifTrue: [result addExpressionToConstraint: constraint].
	constraint enable.
	^ constraint
