debugging
trace: debugMessageString
	"Print trace information followed by a debug message"

	[self thisOSProcess stdOut
		"The process in which the traced message is being evaluated"
		nextPutAll: Processor activeProcess hash printString, ':';
		"The identity of the object being traced"
		nextPutAll: thisContext sender sender sender receiver hash printString, ':';
		"The method context describing the method being evaluated"
		nextPutAll: thisContext sender sender sender printString, ':';
		nextPutAll: debugMessageString;
		nextPut: Character lf;
		flush]
			on: Error
			do: []