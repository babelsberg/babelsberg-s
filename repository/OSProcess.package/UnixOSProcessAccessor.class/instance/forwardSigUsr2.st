signal forwarding
forwardSigUsr2
	"Set a signal handler for SIGUSR2. Answer a new Semaphore, or nil if unable
	to set the handler (possibly because it has already been set)."

	"OSProcess accessor forwardSigUsr1"

	^ self forwardSignal: self primSigUsr2Number
