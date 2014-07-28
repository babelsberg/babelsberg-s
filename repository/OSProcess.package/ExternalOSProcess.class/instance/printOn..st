printing
printOn: aStream

	super printOn: aStream.
	self isComplete ifTrue: [ aStream nextPutAll: ' (', self runState, ' with status ', self exitStatus printString, ')' ]
		ifFalse: [ aStream nextPutAll: ' (', self runState asString, ')' ]