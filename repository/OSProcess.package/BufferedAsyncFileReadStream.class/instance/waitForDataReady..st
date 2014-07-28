read ahead buffer
waitForDataReady: count 
	"Block until at least count characters are available in the readBuffer"

	[self readSyncSemaphore
		critical: [self readBuffer size - readBuffer position < count]]
		whileTrue: [self waitForDataReady]