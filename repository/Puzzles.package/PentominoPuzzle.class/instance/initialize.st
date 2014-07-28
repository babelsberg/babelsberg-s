initialize-release
initialize

	super initialize.
	solver := ConstraintSolver newZ3Solver.
	pentominoStartingPoints := OrderedCollection new.
	pentominoNames := OrderedCollection new.
	allPoints := OrderedCollection new.