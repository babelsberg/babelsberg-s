private
varValue: anObject
"This method should only be called from a ConstraintZ3Solver. Otherwise, the constraints may be broken."
	varValue := anObject.
	(varValue isKindOf: Boolean)
		ifTrue: [self type: 'Bool'].