instance creation
newCassowarySolver

	| solver |
	solver := self new.
	solver externalSolver: (ClSimplexSolver new autoSolve: false).
	^ solver