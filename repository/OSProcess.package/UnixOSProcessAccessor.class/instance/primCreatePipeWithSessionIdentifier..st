private - primitive access
primCreatePipeWithSessionIdentifier: aByteArray
	"Create a pipe, and answer an array of two file handles (SQFile data structures in interp.c)
	for the pipe reader and writer."

	<primitive: 'primitiveCreatePipeWithSessionIdentifier' module: 'UnixOSProcessPlugin'>
	^ nil