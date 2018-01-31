*Constraints-Core
alwaysSolveWith: aConstraintSolver
	"This method constructs constraints for all solvable constraints inside this blockClosure. It uses the given solver object."
	| newProcess constraint |
	constraint := self newConstraintWith: aConstraintSolver.
	newProcess := self newProcessConstructing: constraint.
	
	[[newProcess step] doWhileFalse: [newProcess suspendedContext isNil]
	] ensure: [newProcess terminate].

	constraint enable.
	^ constraint