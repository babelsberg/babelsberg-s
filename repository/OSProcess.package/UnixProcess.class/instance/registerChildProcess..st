child process management
registerChildProcess: anOSProcess

	self processAccessor sigChldSemaphore.
	self processAccessor grimReaperProcess.	 "Start the reaper process if it is not running."
	accessProtect
		critical: [allMyChildren
				at: anOSProcess pid
				put: anOSProcess].
	^ anOSProcess
