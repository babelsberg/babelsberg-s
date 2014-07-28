initialize-release
initialize

	super initialize.
	solver := ConstraintSolver newZ3Solver.
	equalityConstraints := Matrix new: 9.