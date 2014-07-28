instance creation
cassowarySolver

	CassowarySolver ifNil: [CassowarySolver := self basicNew initialize].
	ExternalCassowarySolver ifNil: [ExternalCassowarySolver := ClSimplexSolver new autoSolve: false].
	CassowarySolver externalSolver: ExternalCassowarySolver.
	^ CassowarySolver