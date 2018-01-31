*Constraints-Core
alwaysSolveWithDebug: aConstraintSolver
	"This is used in the constraint debugger to step into the constraint block"
	| constraint result |
	constraint := self newConstraintWith: aConstraintSolver.
	self currentConstraint: constraint.

	result := self value.
	(result respondsTo: #addExpressionToConstraint:)
		ifTrue: [result addExpressionToConstraint: constraint].

	constraint enable.
	^ constraint
