as yet unclassified
initialize

	super initialize.
	solver := ConstraintSolver newZ3Solver.
	solver autoSolve: false.
	solver variableType: 'Int'.
