private - signal forwarding
primPrintAllStacksOnSignal: signalNumber
	"Set a signal handler in the VM which will print all call stacks on the console
	output whenever an external signal sigNum is received. Answer the
	prior value of the signal handler."

	"OSProcess accessor primPrintAllStacksOnSignal: OSProcess accessor primSigUsr1Number"

	"OSProcess accessor primForwardSignal: OSProcess accessor primSigUsr1Number toSemaphore: nil"

	<primitive: 'primitivePrintAllStacksOnSignal' module: 'UnixOSProcessPlugin'>
	^ nil
