printing
printOn: aStream

	super printOn: aStream.
	aStream nextPutAll: ' (', self threadID printString, ', ', self runState, ')'
