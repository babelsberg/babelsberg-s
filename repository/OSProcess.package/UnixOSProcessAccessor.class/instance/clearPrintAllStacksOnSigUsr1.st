signal print stack trace
clearPrintAllStacksOnSigUsr1
	"Clear any signal handler in the VM that was set to print all call stacks on
	console output when a SIGUSR1 is received. Restores default SIGUSR1
	handler, which may result in exiting the VM on this signal. Answer an
	identifier for the previously defined signal handler or nil if no handler
	had been set."

	^self primForwardSignal: self primSigUsr1Number toSemaphore: nil	
