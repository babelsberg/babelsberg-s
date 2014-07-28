OS signal sending
sigabrt: anExternalOSProcess
	"Send a SIGABRT signal to the external process represented by anExternalOSProcess."

	^ self processAccessor primSendSigabrtTo: anExternalOSProcess pid