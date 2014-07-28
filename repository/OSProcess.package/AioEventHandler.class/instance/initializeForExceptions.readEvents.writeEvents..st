initialize-release
initializeForExceptions: exceptionEventFlag readEvents: readEventFlag writeEvents: writeEventFlag

	semaphore := Semaphore new.
	semaIndex := Smalltalk registerExternalObject: semaphore.
	([self aioEnable: self descriptor forSemaphore: self semaIndex externalObject: true]
		on: Warning
		do: [:e |
			self close. "unregister the semaphore"
			self notify: e messageText. nil])
		ifNotNil:
			[handlerProc := self
				handleExceptions: exceptionEventFlag
				readEvents: readEventFlag
				writeEvents: writeEventFlag]
