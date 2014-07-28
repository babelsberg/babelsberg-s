fork and exec
primGetChildExitStatus: childPid
	"Clean up after the death of a child process, and answer the exit status of the child process."

	<primitive: 'primitiveReapChildProcess' module: 'UnixOSProcessPlugin'>
	^ Array with: childPid with: nil