OS signal sending
sigint: anExternalOSProcess
	"Send a SIGINT signal to the external process represented by anExternalOSProcess."

	^ self processAccessor primSendSigintTo: anExternalOSProcess pid