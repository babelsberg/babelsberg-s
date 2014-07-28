signal forwarding
restoreSigHup
	"Unset a SIGHUP signal handler and unregister the Smalltalk semaphore.
	Answer the unregistered Semaphore, or nil if unable to restore the signal
	(possibly because no handler had been set)."

	"OSProcess accessor restoreSigHup"

	^ self restoreSignal: self primSigHupNumber
