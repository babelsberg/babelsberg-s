OS signal sending
sigpipe: anExternalOSProcess
	"Send a SIGPIPE signal to the external process represented by anExternalOSProcess."

	^ self processAccessor primSendSigpipeTo: anExternalOSProcess pid