signal forwarding
restoreSigTerm
	"Unset a SIGTERM signal handler and unregister the Smalltalk semaphore.
	Answer the unregistered Semaphore, or nil if unable to restore the signal
	(possibly because no handler had been set)."

	"OSProcess accessor restoreSigTerm"

	^ self restoreSignal: self primSigTermNumber
