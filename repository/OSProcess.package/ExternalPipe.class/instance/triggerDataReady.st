updating
triggerDataReady
	"Notify any object waiting for data ready on the pipe."

	self triggerEvent: #dataReady.
