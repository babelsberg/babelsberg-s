signal forwarding
restoreSigPipe
	"Unset a SIGPIPE signal handler and unregister the Smalltalk semaphore.
	Answer the unregistered Semaphore, or nil if unable to restore the signal
	(possibly because no handler had been set)."

	"OSProcess accessor restoreSigPipe"

	^ self restoreSignal: self primSigPipeNumber
