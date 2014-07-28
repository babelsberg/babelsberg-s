OS signal sending
sigterm: anExternalOSProcess
	"Send a SIGTERM signal to the external process represented by anExternalOSProcess."

	^ self processAccessor primSendSigtermTo: anExternalOSProcess pid