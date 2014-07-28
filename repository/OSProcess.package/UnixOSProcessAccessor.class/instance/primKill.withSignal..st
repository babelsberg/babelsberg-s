private - primitive access
primKill: listOfPids withSignal: signumOrNil
	"Set a list of pids to kill with signum when VM exits. If the signum
	parameter is nil, the default value of SIGTERM will be used."

	<primitive: 'primitiveKillOnExit' module: 'UnixOSProcessPlugin'>
	^ self primitiveFailed