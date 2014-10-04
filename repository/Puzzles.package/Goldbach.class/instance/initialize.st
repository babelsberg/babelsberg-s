initialize-release
initialize

	super initialize.
	solver := ConstraintSolver newZ3Solver.
	solver autoSolve: false.
	solver variableType: 'Int'.
