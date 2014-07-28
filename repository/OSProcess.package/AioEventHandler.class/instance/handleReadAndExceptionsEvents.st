handler process
handleReadAndExceptionsEvents
	"Generate a #changed notification whenever data is available for reading or an exception
	occurs on the external IO channel."

	^ self handleExceptions: true readEvents: true writeEvents: false
