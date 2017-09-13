instance creation
newZ3VariableFor: aValue

	| cv |
	cv := ConstraintZ3Variable new.
	cv 
		originalValue: aValue;
		varValue: aValue;
		solver: (Processor activeProcess environmentAt: #constraintObject) solver.
	cv solver addVariable: cv.
	^ cv