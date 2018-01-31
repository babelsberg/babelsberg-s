instance creation
newZ3VariableFor: aValue withName: aName

	| cv |
	cv := ConstraintZ3Variable new.
	cv 
		originalValue: aValue;
		varValue: aValue;
		solver: self currentConstraintSolver;
		varName: aName.
	cv solver addVariable: cv.
	^ cv