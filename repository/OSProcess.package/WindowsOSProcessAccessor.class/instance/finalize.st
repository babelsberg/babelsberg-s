initialize - release
finalize
	"Clean up grimReaper and associated semaphore."

	grimReaper ifNotNil:
			[grimReaper terminate.
			grimReaper := nil].
	sigChldSemaphore ifNotNil:
			[Smalltalk unregisterExternalObject: sigChldSemaphore.
			sigChldSemaphore := nil].
	semaIndex := nil
