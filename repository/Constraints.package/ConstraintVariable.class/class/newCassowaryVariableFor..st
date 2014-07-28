instance creation
newCassowaryVariableFor: aNumber

	| cv extVar |
	cv := ConstraintCassowaryVariable new.
	extVar := ClVariable newWith: aNumber asFloat name: aNumber name.
	cv 
		originalValue: aNumber;
		externalVariable: extVar;
		solver: (Processor activeProcess environmentAt: #constraintObject) solver.
	cv solver addStay: cv.
	^ cv