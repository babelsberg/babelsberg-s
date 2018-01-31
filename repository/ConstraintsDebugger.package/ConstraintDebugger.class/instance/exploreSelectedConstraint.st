constraints-access
exploreSelectedConstraint
	| co |
	co :=  self currentConstraint.
	self flag: #XXX.
	((co respondsTo: #externalConstraints)
		ifTrue: [co externalConstraints at: self constraintIndex]
		ifFalse: [co expressions at: self constraintIndex]) explore.