external process access
primSetPGrp
	"Set a new process group for this OS process. Newly created child processes
	will be members of the new process group."

	<primitive: 'primitiveSetPGrp' module: 'UnixOSProcessPlugin'>
	^ nil