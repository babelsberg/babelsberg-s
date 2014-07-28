solving
enable

	self externalConstraints 
		ifNotEmpty: [self addConstraintsToSolver]
		ifEmpty: [Transcript show: 'WARNING - There is no constraint to enable.'; cr.].