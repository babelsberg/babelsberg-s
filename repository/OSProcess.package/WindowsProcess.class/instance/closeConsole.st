console
closeConsole
	"Close the console. The standard input, output and error streams will no longer be available."

	"OSProcess thisOSProcess closeConsole"

	self processAccessor primFreeConsole.
	self refreshFromProcessAccessor
