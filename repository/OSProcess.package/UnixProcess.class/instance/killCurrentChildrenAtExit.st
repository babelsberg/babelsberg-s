VM atexit
killCurrentChildrenAtExit
	"Arrange for the currently active child processes to receive a SIGTERM
	signal then the Squeak VM exits. Each invokation of this method overrides
	the effects of any previous calls."

	"OSProcess thisOSProcess killCurrentChildrenAtExit"

	self processAccessor killOnVmExit: allMyChildren withSignal: nil
