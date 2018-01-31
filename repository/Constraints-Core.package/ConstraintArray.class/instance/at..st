accessing
at: index

	| cv atValue |
	atValue := super at: index.
	self isConstructingConstraint ifFalse: [^ atValue value].
	
	cv := atValue asConstraintVariableForMethodName: 'constraintArrayItem'.
	super at: index put: cv.
	^ cv
