constraints-access
constraintList
	| co |
	co := (Processor activeProcess environmentAt: #constraintObject).
	self flag: #XXX.
	(co respondsTo: #externalConstraints)
		ifTrue: [^ co externalConstraints]
		ifFalse: [^ co expressions]