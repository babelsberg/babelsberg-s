signal forwarding
restoreSigKill
	"Unset a SIGKILL signal handler and unregister the Smalltalk semaphore.
	Answer the unregistered Semaphore, or nil if unable to restore the signal
	(possibly because no handler had been set)."

	"OSProcess accessor restoreSigKill"

	self notify: 'SIGKILL and SIGSTOP signals cannot be caught, see man signal(2)'.
	^ self restoreSignal: self primSigIntNumber
