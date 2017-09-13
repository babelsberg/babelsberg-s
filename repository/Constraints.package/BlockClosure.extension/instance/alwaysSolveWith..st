*Constraints-Core
alwaysSolveWith: aConstraintSolver
	"This method constructs constraints for all solvable constraints inside this blockClosure. It uses the given solver object."
	| newProcess constraint |
	newProcess := self newTerminatingProcess.
	constraint := aConstraintSolver class constraintClass new
					constraintBlock: self;
					priority: ConstraintPriority required;
					solver: aConstraintSolver;
					yourself.
	Processor activeProcess environmentAt: #constraintObject put: constraint.
	[#ccm withLayerDo: [[newProcess step] doWhileFalse: [newProcess suspendedContext isNil]]]
		ensure: [Processor activeProcess environmentRemoveKey: #constraintObject. 
				newProcess terminate].
	constraint enable.
	^ constraint