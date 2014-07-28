private - primitive access
primGetStdErrHandle
	"Answer the handle (a SQFile data structure in interp.c) for the standard error for the
	OS process in which I am currently executing."

	<primitive: 'primitiveGetStdErrHandle' module: 'UnixOSProcessPlugin'>
	^ nil