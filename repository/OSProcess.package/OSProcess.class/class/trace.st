debugging
trace
	"Print the sender's context on standard output. The debug message is
	prefixed with the identity of the process in which the method is being
	evaluated, and the identity of the object which received the message.
	Useful for debugging timing or deadlock problems."

	[self thisOSProcess stdOut
		"The process in which the traced message is being evaluated"
		nextPutAll: Processor activeProcess hash printString, ':';
		"The identity of the object being traced"
		nextPutAll: thisContext sender sender sender receiver hash printString, ':';
		"The method context describing the method being evaluated"
		nextPutAll: thisContext sender sender sender printString;
		nextPut: Character lf;
		flush]
			on: Error
			do: []