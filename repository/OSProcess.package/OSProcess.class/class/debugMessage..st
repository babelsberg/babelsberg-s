debugging
debugMessage: aString
	"Print aString on standard output. The debug message is prefixed with the
	identity of the process in which the method is being evaluated, and the
	identity of the object which received the message. Useful for debugging
	timing or deadlock problems."

	[self thisOSProcess stdOut
		"The process in which the traced message is being evaluated"
		nextPutAll: Processor activeProcess hash printString, ':';
		"The identity of the object being traced"
		nextPutAll: thisContext sender sender sender receiver hash printString, ':';
		"The debug message"
		nextPutAll: aString asString; nextPut: Character lf; flush]
			on: Error
			do: []