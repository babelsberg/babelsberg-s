standard IO handles
getStdInHandle
	"Answer the handle (a SQFile data structure in interp.c) for the standard input for the
	OS process in which I am currently executing."

	^ self ioAccessorFromSQFile: self getStdIn
