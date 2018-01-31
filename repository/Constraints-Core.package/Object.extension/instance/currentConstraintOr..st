*Constraints-Core
currentConstraintOr: aBlock

	^ (Processor activeProcess environmentAt: #constraintObject ifAbsent: [])
		ifNil: aBlock