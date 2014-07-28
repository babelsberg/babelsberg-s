VM atexit
kill: listOfPids withSignal: signumOrNil
	"On exit of the VM process, send signal to the external processes
	identified by listOfPids. If signumOrNil is nil, the default SIGTERM
	signal will be sent to listOfPids."

	^ self primKill: listOfPids withSignal: signumOrNil
