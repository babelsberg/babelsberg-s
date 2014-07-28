handler process
handleReadEvents
	"Generate a #changed notification whenever data is available for reading"

	^ self handleExceptions: false readEvents: true writeEvents: false
