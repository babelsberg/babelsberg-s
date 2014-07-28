read, write, position
peek
	"Answer what would be returned if the message next were sent to the
	receiver. If the receiver is at the end, answer nil. "

	((self readSyncSemaphore
				critical: [self readBuffer atEnd])
			and: [self isBlocking])
		ifTrue: [self waitForDataReady].
	^ self readSyncSemaphore
		critical: [readBuffer peek]