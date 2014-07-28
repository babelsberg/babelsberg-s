signal forwarding
restoreSigQuit
	"Unset a SIGQUIT signal handler and unregister the Smalltalk semaphore.
	Answer the unregistered Semaphore, or nil if unable to restore the signal
	(possibly because no handler had been set)."

	"OSProcess accessor restoreSigQuit"

	^ self restoreSignal: self primSigQuitNumber
