initialize-release
close
	"When the FileStream or Socket handled by this aio handler is closed,
	it should send #close to this handler."

	| p |
	self breakDependents.
	Smalltalk unregisterExternalObject: semaphore.
	self aioDisable: self descriptor.
	semaphore := nil.
	semaIndex := nil.
	p := handlerProc.
	handlerProc := nil.
	p ifNotNil: [p terminate] "p may be the active process, do this last"
