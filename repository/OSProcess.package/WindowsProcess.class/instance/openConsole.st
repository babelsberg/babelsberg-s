console
openConsole
	"Open a console. This makes the standard input, output and error streams available."

	"OSProcess thisOSProcess openConsole"

	self processAccessor primAllocConsole.
	self refreshFromProcessAccessor
