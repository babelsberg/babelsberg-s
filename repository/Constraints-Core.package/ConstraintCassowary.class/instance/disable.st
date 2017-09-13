solving
disable

	self externalConstraints 
		ifNotEmpty: [self removeConstraintsFromSolver]
		ifEmpty: [Transcript show: 'WARNING - There is no constraint to disable.'; cr].