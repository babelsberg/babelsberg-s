initialize - release
initialize
	"Create and register a semaphore to be used for signaling external process exits"

	super initialize.
	self sigChldSemaphoreSet.
	self grimReaperProcess
