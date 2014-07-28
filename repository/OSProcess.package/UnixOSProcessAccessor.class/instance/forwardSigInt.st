signal forwarding
forwardSigInt
	"Set a signal handler for SIGINT. Answer a new Semaphore, or nil if unable
	to set the handler (possibly because it has already been set)."

	"OSProcess accessor forwardSigInt"

	^ self forwardSignal: self primSigIntNumber
