OS signal sending
sighup: anExternalOSProcess
	"Send a SIGHUP signal to the external process represented by anExternalOSProcess."

	^ self processAccessor primSendSighupTo: anExternalOSProcess pid