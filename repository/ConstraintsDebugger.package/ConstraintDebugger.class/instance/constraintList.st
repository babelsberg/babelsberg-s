constraints-access
constraintList
	| co |
	co := (Processor activeProcess environmentAt: #constraintObject ifAbsent: [^ #()]).
	self flag: #XXX.
	(co respondsTo: #externalConstraints)
		ifTrue: [^ co externalConstraints]
		ifFalse: [^ co expressions]