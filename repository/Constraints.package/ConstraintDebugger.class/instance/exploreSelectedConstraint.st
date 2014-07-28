constraints-access
exploreSelectedConstraint
	| co |
	co := (Processor activeProcess environmentAt: #constraintObject).
	self flag: #XXX.
	((co respondsTo: #externalConstraints)
		ifTrue: [co externalConstraints at: self constraintIndex]
		ifFalse: [co expressions at: self constraintIndex]) explore.