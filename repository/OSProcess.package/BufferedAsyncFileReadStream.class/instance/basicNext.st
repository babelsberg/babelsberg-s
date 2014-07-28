read, write, position
basicNext
	"Answer the next byte from this file, or nil if at the end of the file.
	If the readBuffer is empty, force a basicNext in order to ensure that
	the end of file flag is updated (in stdio stream)."

	(self readSyncSemaphore
			critical: [self readBuffer atEnd])
		ifTrue: [^ super basicNext]
		ifFalse: [[self isBlocking]
				ifTrue: [self waitForDataReady].
			^ self readSyncSemaphore
				critical: [readBuffer next]]