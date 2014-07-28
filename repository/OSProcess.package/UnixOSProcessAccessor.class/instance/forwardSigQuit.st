signal forwarding
forwardSigQuit
	"Set a signal handler for SIGQUIT. Answer a new Semaphore, or nil if unable
	to set the handler (possibly because it has already been set)."

	"OSProcess accessor forwardSigQuit"

	^ self forwardSignal: self primSigQuitNumber
