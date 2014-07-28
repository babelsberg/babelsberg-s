updating
refreshFromProcessAccessor
	"Set my instance variables to reflect the state of the OS process in which this Smalltalk
	virtual machine is executing."

	self needsRefresh ifTrue: [
		sessionID := self processAccessor getSessionIdentifier.
		pid := processAccessor primGetPid.
		ppid := processAccessor primGetPPid.
		pthread := processAccessor getThreadID.
		self setStdIn.
		self setStdOut.
		self setStdErr.
		programName := self getProgramName.
		arguments := self getArgumentList.
		environment := self getEnvironmentDictionary.
		path := self pathString.
		self updateAllMyChildren]
