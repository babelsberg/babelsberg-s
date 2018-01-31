*Constraints-Core
currentConstraint: aConstraint during: aBlock

	self currentConstraint: aConstraint.
	^ aBlock ensure: [self removeCurrentConstraint]
