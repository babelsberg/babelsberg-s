*Constraints-Core
currentConstraintSolver

	| cc |
	cc := self currentConstraint.
	(cc isNil or: [cc isConstraint not]) ifTrue: [self halt]. "what?"
	^ cc solver
