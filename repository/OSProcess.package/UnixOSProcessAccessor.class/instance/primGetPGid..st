external process access
primGetPGid: pid
	"Answer the process group ID of the process identified by pid"

	<primitive: 'primitiveGetPGid' module: 'UnixOSProcessPlugin'>
	^ nil