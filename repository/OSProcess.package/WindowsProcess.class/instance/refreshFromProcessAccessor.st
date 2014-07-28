updating
refreshFromProcessAccessor
	"Set my instance variables to reflect the state of the OS process in which this Smalltalk
	virtual machine is executing."

	sessionID := self processAccessor getSessionIdentifier.
	pid := processAccessor primGetPid.
	self setStdIn.
	self setStdOut.
	self setStdErr.
	environment := self getEnvironmentDictionary
