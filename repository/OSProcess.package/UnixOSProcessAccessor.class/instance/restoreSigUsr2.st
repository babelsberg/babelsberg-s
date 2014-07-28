signal forwarding
restoreSigUsr2
	"Unset a SIGUSR2 signal handler and unregister the Smalltalk semaphore.
	Answer the unregistered Semaphore, or nil if unable to restore the signal
	(possibly because no handler had been set)."

	"OSProcess accessor restoreSigUsr2"

	^ self restoreSignal: self primSigUsr2Number
