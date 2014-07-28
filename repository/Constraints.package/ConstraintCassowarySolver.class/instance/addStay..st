manipulating
addStay: aConstraintVariable

	self stayConstraints add: aConstraintVariable.
	self externalSolver addStay: aConstraintVariable externalVariable.