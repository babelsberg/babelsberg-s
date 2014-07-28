OS signal sending
sigkill: anExternalOSProcess
	"Send a SIGKILL signal to the external process represented by anExternalOSProcess."

	^ self processAccessor primSendSigkillTo: anExternalOSProcess pid