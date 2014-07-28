child process management
primCanAccessChildProcess: handleObject
	"Answer true if the OS process represented by a HANDLE can be accessed by this OS process."

	<primitive: 'primitiveCanAccessChildProcess' module: 'Win32OSProcessPlugin'>

	^ false