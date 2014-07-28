child process management
primGetExitStatusForHandle: handleObject
	"Answer the exit status for the process represented by a HANDLE. Fail if
	the process is still active, or if the GetExitCodeProcess call fails."

	"| procInfo |
	procInfo := OSProcess accessor primCommand: 'SOL'.
	(Delay forSeconds: 5) wait.
	OSProcess accessor primGetExitStatusForHandle: procInfo first"

	<primitive: 'primitiveGetExitStatusForHandle' module: 'Win32OSProcessPlugin'>

	^ nil