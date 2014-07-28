private - primitive access
primDup: fileDescriptor
	"Call dup2 to duplicate a file descriptor to the next available descriptor. Answer
	the new file descriptor or -1 on failure."

	<primitive: 'primitiveDup' module: 'UnixOSProcessPlugin'>
	^ self primitiveFailed
