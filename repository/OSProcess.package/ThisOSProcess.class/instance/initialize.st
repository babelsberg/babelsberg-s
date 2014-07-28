initialize - release
initialize
	"Set my instance variables to reflect the state of the OS process in which 
	this Smalltalk virtual machine is. executing."

	accessProtect := Semaphore forMutualExclusion.
	self initializeAllMyChildren.
	processAccessor ifNotNil:
		[processAccessor breakDependents.
		processAccessor := nil].
	((self processAccessor notNil
		and: [processAccessor canAccessSystem])
			and: [pid ~= processAccessor primGetPid])
		ifTrue: [self resetChildProcessDictionary]
