VM atexit
killOnVmExit: proxies withSignal: signumOrNil
	"When Squeak uses OSProcess to start a long running external process, it
	may be useful to guarantee that one or more child processes is killed when
	the Squeak VM exits, regardless of whether the normal Squeak shutdown
	processing has occurred. This method arranges for a collection of external
	process proxies to receive a signal when the Squeak VM exits. If signumOrNil
	is nil, the default SIGTERM will be used. Each invocation of this method will
	override the effects of previous calls."

	"OSProcess accessor killOnVmExit: OSProcess thisOSProcess allMyChildren withSignal: nil"

	| pids |
	pids := (proxies select: [:p | p isRunning] thenCollect: [:e | e pid]) asArray.
	^ self kill: pids withSignal: signumOrNil
