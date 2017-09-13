comparing
removeStay

	self stayConstraint ifNil: [Transcript show: 'WARNING - Cannot remove stay constraint, because the variable has no stay constraint.'; cr. ^ self].
	self stayConstraint disable.
	self stayConstraint: nil.