instance creation
forSocket: aSocket exceptions: exceptionEventFlag readEvents: readEventFlag writeEvents: writeEventFlag
	"Flag parameters are true or false, indicating types of events to be handled."

	"self forSocket: Socket new"

	^ self new forSocket: aSocket
			exceptions: exceptionEventFlag
			readEvents: readEventFlag
			writeEvents: writeEventFlag
