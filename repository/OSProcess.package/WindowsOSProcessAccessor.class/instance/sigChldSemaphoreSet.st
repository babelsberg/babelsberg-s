child process management
sigChldSemaphoreSet

	sigChldSemaphore ifNil:
		[sigChldSemaphore := Semaphore new.
		semaIndex := Smalltalk registerExternalObject: sigChldSemaphore].
	^ sigChldSemaphore