instance creation
forFileStream: aFileStream exceptions: exceptionEventFlag readEvents: readEventFlag writeEvents: writeEventFlag
	"Flag parameters are true or false, indicating types of events to be handled."

	"self forFileStream: SourceFiles first"

	^ self new forFileStream: aFileStream
			exceptions: exceptionEventFlag
			readEvents: readEventFlag
			writeEvents: writeEventFlag
