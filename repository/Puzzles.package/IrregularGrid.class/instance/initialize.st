initialize-release
initialize

	super initialize.
	irregularPuzzleGui := IrregularGridGUI new.
	solver := ConstraintSolver newZ3Solver.