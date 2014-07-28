initialize-release
setDefaultEventMask
	"Default initialization for read events and exception events"

	^ self initializeForExceptions: true readEvents: true writeEvents: false

