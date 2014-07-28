derived accessing
averageTime

	^ self count == 0
		ifTrue: [0]
		ifFalse: [self totalTime / self count asFloat]