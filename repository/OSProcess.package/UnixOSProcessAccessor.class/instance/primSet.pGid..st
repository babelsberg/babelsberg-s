external process access
primSet: pid pGid: processGroupId
	"Set the process group ID of the process identified by pid to a new process
	group ID."

	<primitive: 'primitiveSetPGid' module: 'UnixOSProcessPlugin'>
	^ nil