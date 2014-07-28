pthreads
primGetThreadID
	"Answer the ID of the pthread that is currently executing (the interpreter thread).
	A thread ID may be a 64 bit value on some platforms, so answer a byte array
	containing the value in machine-dependent byte order."

	"OSProcess accessor primGetThreadID"

	<primitive: 'primitiveGetThreadID' module: 'UnixOSProcessPlugin'>
	^ nil