manipulating
removeConstraint: aConstraint

	(self constraints includes: aConstraint)
		ifFalse: [Transcript show: 'WARNING - The constraint cannot be disabled, because it is not enabled.'; cr. ^ self].

	self constraints remove: aConstraint.
