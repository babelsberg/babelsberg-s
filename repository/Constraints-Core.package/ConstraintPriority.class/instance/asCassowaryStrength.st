accessing
asCassowaryStrength

	val = 0 ifTrue: [^ ClStrength required].
	val = 1 ifTrue: [^ ClStrength strong].
	val = 2 ifTrue: [^ ClStrength medium].
	val = 3 ifTrue: [^ ClStrength weak].