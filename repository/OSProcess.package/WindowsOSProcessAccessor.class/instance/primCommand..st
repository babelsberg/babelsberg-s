deprecated
primCommand: commandString
	"Run a command in a new external process. Answer a result array with
	hProcess, hThread, dwProcessId, dwThreadId.

	This primitive has been replaced by #primCommand:stdIn:stdOut:stdErr:, and
	will be removed in future versions of OSProcess."

	"OSProcess accessor primCommand: 'C:\WINDOWS\SOL'"
	"OSProcess accessor primCommand: 'SOL'"
	"OSProcess accessor primCommand: 'NoSuchProgram'"

	<primitive: 'primitiveCommand' module: 'Win32OSProcessPlugin'>

	^ nil