OS signal sending
sigstop: anExternalOSProcess
	"Send a SIGSTOP signal to the external process represented by anExternalOSProcess."

	^ self processAccessor primSendSigstopTo: anExternalOSProcess pid