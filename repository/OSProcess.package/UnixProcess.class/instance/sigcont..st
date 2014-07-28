OS signal sending
sigcont: anExternalOSProcess
	"Send a SIGCONT signal to the external process represented by anExternalOSProcess."

	^ self processAccessor primSendSigcontTo: anExternalOSProcess pid