signal print stack trace
setPrintAllStacksOnSigUsr1
	"Set a signal handler in the VM that will print all call stacks on console output
	whenever a SIGUSR1 is received. Answer an identifier for the previously
	defined signal handler or nil if this signal handler has already been set."
	
	"OSProcess accessor setPrintAllStacksOnSigUsr1"
	"OSProcess accessor clearPrintAllStacksOnSigUsr1"

	^self primPrintAllStacksOnSignal: self primSigUsr1Number	
