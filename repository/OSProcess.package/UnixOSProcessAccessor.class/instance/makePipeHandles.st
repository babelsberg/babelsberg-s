pipe open
makePipeHandles
	"Create a pipe, and answer an array of two IO accessors for the pipe 
	reader and writer. Set a signal handler to cause SIGPIPE signals to be
	ignored. This will register a Semaphore to receive the SIGPIPE events,
	but we will simply ignore the semaphore, effectively ignoring the
	external OS signals. This is done instead of explicitly telling the OS to
	ignore the signals because it allows the use of a uniform signal
	forwarding mechanism in Squeak, even for signals that are ultimately
	ignored."

	self forwardSigPipe.
	^ super makePipeHandles
