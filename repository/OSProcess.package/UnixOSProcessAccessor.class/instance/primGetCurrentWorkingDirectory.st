external process access
primGetCurrentWorkingDirectory
	"Call getcwd() to get the current working directory."

	"OSProcess thisOSProcess processAccessor primGetCurrentWorkingDirectory"

	<primitive: 'primitiveGetCurrentWorkingDirectory' module: 'UnixOSProcessPlugin'>
	^ nil
