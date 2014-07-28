read ahead buffer
waitForDataReady
	"Block until at least one character is available in the readBuffer. This is not
	thread safe, and only one Process is permitted to send this message."

	self dataAvailableSemaphore wait
