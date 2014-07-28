OS signal sending
sigchld: anExternalOSProcess
	"Send a SIGCHLD signal to the external process represented by anExternalOSProcess."

	^ self processAccessor primSendSigchldTo: anExternalOSProcess pid