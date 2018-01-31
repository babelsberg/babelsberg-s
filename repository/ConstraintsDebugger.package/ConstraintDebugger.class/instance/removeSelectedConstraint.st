constraints-access
removeSelectedConstraint
	| co |
	co :=  self currentConstraint.
	self flag: #XXX.
	(co respondsTo: #externalConstraints)
		ifTrue: [co externalConstraints removeAt: self constraintIndex]
		ifFalse: [co expressions removeAt: self constraintIndex].
	self changed: #constraintList.
	self changed: #constraintIndex.