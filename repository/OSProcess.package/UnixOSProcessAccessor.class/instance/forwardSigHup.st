signal forwarding
forwardSigHup
	"Set a signal handler for SIGHUP. Answer a new Semaphore, or nil if unable
	to set the handler (possibly because it has already been set)."

	"OSProcess accessor forwardSigHup"

	^ self forwardSignal: self primSigHupNumber
