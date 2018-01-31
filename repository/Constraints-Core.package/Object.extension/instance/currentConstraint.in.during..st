*Constraints-Core
currentConstraint: aConstraint in: aProcess during: aBlock

	self currentConstraint: aConstraint in: aProcess.
	^ aBlock ensure: [self removeCurrentConstraintIn: aProcess]
