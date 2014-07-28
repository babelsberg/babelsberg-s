private - primitive access
primDup: oldFileDescriptor to: newFileDescriptor
	"Call dup2() to duplicate a file descriptor. Answer the duplicated file descriptor
	or -1 on failure."

	<primitive: 'primitiveDupTo' module: 'UnixOSProcessPlugin'>
	^ self primitiveFailed
