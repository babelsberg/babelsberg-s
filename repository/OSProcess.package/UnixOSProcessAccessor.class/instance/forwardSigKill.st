signal forwarding
forwardSigKill
	"Set a signal handler for SIGKILL. Answer a new Semaphore, or nil if unable
	to set the handler (possibly because it has already been set)."

	"OSProcess accessor forwardSigKill"

	self notify: 'SIGKILL and SIGSTOP signals cannot be caught, see man signal(2)'.
	^ self forwardSignal: self primSigKillNumber
