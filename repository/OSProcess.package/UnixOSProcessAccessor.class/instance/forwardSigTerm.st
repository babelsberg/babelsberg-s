signal forwarding
forwardSigTerm
	"Set a signal handler for SIGTERM. Answer a new Semaphore, or nil if unable
	to set the handler (possibly because it has already been set)."

	"OSProcess accessor forwardSigTerm"

	^ self forwardSignal: self primSigTermNumber
