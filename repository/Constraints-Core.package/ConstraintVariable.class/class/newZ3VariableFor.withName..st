instance creation
newZ3VariableFor: aValue withName: aName

	| cv |
	cv := ConstraintZ3Variable new.
	cv 
		originalValue: aValue;
		varValue: aValue;
		solver: (Processor activeProcess environmentAt: #constraintObject) solver;
		varName: aName.
	cv solver addVariable: cv.
	^ cv