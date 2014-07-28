OS signal sending
sigusr2: anExternalOSProcess
	"Send a SIGUSR2 signal to the external process represented by anExternalOSProcess."

	^ self processAccessor primSendSigusr2To: anExternalOSProcess pid