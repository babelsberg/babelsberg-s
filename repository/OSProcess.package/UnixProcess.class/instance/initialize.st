initialize - release
initialize
	"Set my instance variables to reflect the state of the OS process in which 
	this Smalltalk virtual machine is executing."

	super initialize.
	(self processAccessor notNil and: [processAccessor canAccessSystem])
		ifTrue: 
			[self refreshFromProcessAccessor]
		ifFalse: 
			[stdIn := nil.
			stdOut := nil.
			stdErr := nil].
	processAccessor restartChildWatcherProcess
