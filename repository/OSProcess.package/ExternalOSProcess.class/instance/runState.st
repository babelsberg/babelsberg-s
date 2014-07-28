accessing
runState

	^ runState ifNil: [self unknownRunState]
