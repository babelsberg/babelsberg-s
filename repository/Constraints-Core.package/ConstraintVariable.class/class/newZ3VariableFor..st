instance creation
newZ3VariableFor: aValue

	| cv |
	cv := ConstraintZ3Variable new.
	cv 
		originalValue: aValue;
		varValue: aValue;
		solver: self currentConstraintSolver.
	cv solver addVariable: cv.
	^ cv