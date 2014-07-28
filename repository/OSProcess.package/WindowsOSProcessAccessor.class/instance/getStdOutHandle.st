standard IO handles
getStdOutHandle
	"Answer the handle (a SQFile data structure in interp.c) for the standard output for the
	OS process in which I am currently executing."

	^ self ioAccessorFromSQFile: self getStdOut
