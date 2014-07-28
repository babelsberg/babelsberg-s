OS signal sending
sigusr1: anExternalOSProcess
	"Send a SIGUSR1 signal to the external process represented by anExternalOSProcess."

	^ self processAccessor primSendSigusr1To: anExternalOSProcess pid