instance creation
for: aSocketOrFileStream exceptions: exceptionEventFlag readEvents: readEventFlag writeEvents: writeEventFlag
	"Flag parameters are true or false, indicating types of events to be handled."

	^ self new for: aSocketOrFileStream
			exceptions: exceptionEventFlag
			readEvents: readEventFlag
			writeEvents: writeEventFlag