handler process
handleExceptions: exceptionEventFlag readEvents: readEventFlag writeEvents: writeEventFlag
	"Generate a #changed notification whenever the requested type of external aio event occurs."

	| p sema handler |
	sema := Semaphore new.
	handler := [[self hasValidHandler] whileTrue:
		[self aioHandle: self descriptor
			exceptionEvents: exceptionEventFlag
			readEvents: readEventFlag
			writeEvents: writeEventFlag.
		sema signal. "event handler is ready"
		self semaphore wait.
		self changed]].
	p := handler forkAt: Processor userBackgroundPriority.
	sema wait. "until process has been started and events are being handled"
	^p