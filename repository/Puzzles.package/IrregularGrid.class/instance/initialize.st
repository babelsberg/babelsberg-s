initialize-release
initialize

	super initialize.
	solver := ConstraintSolver newZ3Solver.