finalization
finalize
	"Note: An aio handler will not be garbage collected until the semaphore
	is unregistered. When the FileStream or Socket handled by this aio
	handler is closed, it should send #close to this handler."

	self close
