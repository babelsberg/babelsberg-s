read, write, position
next

	((self readSyncSemaphore
				critical: [self readBuffer atEnd])
			and: [self isBlocking])
		ifTrue: [self waitForDataReady].
	^ self readSyncSemaphore
		critical: [readBuffer next]