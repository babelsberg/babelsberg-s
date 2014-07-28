OS signal sending
sigalrm: anExternalOSProcess
	"Send a SIGALRM signal to the external process represented by anExternalOSProcess."

	^ self processAccessor primSendSigalrmTo: anExternalOSProcess pid