OS signal sending
sigquit: anExternalOSProcess
	"Send a SIGQUIT signal to the external process represented by anExternalOSProcess."

	^ self processAccessor primSendSigquitTo: anExternalOSProcess pid