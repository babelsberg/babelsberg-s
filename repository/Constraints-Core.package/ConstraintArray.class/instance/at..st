accessing
at: index

	Processor activeProcess isConstructingConstraint
		ifTrue: [ | cv |
				cv := (super at: index) asConstraintVariableForMethodName: 'constraintArrayItem'.
				super at: index put: cv.
				^ cv].
	^ (super at: index) value