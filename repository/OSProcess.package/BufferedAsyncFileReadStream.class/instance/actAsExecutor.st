finalization
actAsExecutor

	super actAsExecutor.
	nonBlockingMode := nil.
	readBuffer := nil.
	readSyncSemaphore := nil.
	dataAvailableSemaphore := nil
