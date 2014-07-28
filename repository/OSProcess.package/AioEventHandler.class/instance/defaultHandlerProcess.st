handler process
defaultHandlerProcess
	"Generate a #changed notification whenever an external aio event occurs"

	^ self handleReadAndExceptionsEvents