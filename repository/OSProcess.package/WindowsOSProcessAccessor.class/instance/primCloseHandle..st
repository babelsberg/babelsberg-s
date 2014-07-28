handles
primCloseHandle: handleObject
	"Close the specified handle, which may refer to a process, a thread, or
	some other Win32 object."

	"| procInfo |
	procInfo := OSProcess accessor primCommand: 'SOL'.
	OSProcess accessor primCloseHandle: procInfo first"

	<primitive: 'primitiveCloseHandle' module: 'Win32OSProcessPlugin'>

	^ nil