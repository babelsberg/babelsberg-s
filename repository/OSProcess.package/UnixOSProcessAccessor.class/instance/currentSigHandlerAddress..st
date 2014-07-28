debugging
currentSigHandlerAddress: signalNumber
	"Answer the current machine address of the signal handler for signalNumber,
	expressed as a ByteArray.

	Temporarily set a signal forwarded for signalNumber, and remember the
	machine address of the prior signal handler. Restore the signal handler
	to its previous value, and answer the machine address of the handler."

	"OSProcess accessor currentSigHandlerAddress: OSProcess accessor primSigIntNumber"

	| sema index previousHandlerAddress |
	sema := Semaphore new.
	index := Smalltalk registerExternalObject: sema.
	(previousHandlerAddress := self primForwardSignal: signalNumber toSemaphore: index)
		ifNil:
			[Smalltalk unregisterExternalObject: sema.
			^ self error: 'could not forward signal number ', signalNumber asString].
	self restoreSignal: signalNumber.
	^ previousHandlerAddress