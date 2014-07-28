solving
enable

	self expressions 
		ifNotEmpty: [self addConstraintsToSolver]
		ifEmpty: [Transcript show: 'WARNING - There is no constraint to enable.'; cr.].