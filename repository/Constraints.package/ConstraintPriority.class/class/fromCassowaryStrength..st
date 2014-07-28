instance creation
fromCassowaryStrength: aClStrength

	aClStrength isRequired ifTrue: [^ ConstraintPriority required].
	aClStrength isStrong ifTrue: [^ ConstraintPriority strong].
	aClStrength isMedium ifTrue: [^ ConstraintPriority medium].
	aClStrength isWeak ifTrue: [^ ConstraintPriority weak].