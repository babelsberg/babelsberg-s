signal forwarding
forwardSigPipe
	"Set a signal handler for SIGPIPE. Answer a new Semaphore, or nil if unable
	to set the handler (possibly because it has already been set)."

	"OSProcess accessor forwardSigPipe"

	^ self forwardSignal: self primSigPipeNumber
