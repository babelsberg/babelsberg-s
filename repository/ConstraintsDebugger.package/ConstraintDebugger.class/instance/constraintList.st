constraints-access
constraintList
	| co |
	co := self currentConstraintOr: [^ #()].
	self flag: #XXX.
	(co respondsTo: #externalConstraints)
		ifTrue: [^ co externalConstraints]
		ifFalse: [^ co expressions]