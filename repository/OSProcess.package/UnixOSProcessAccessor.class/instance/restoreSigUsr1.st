signal forwarding
restoreSigUsr1
	"Unset a SIGUSR1 signal handler and unregister the Smalltalk semaphore.
	Answer the unregistered Semaphore, or nil if unable to restore the signal
	(possibly because no handler had been set)."

	"OSProcess accessor restoreSigUsr1"

	^ self restoreSignal: self primSigUsr1Number
