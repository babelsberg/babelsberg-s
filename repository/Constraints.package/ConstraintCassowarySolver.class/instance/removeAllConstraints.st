manipulating
removeAllConstraints

	super removeAllConstraints.
	self externalSolver initialize.
	self externalSolver autoSolve: false.