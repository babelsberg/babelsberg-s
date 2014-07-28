testing
testFileWritableEvent

	| eventHandler anOpenFile fileHandle aioHandleResult sema semaIndex aioEnableResult fileName |
	fileName := 'DeleteThisTemporaryFile'.

	eventHandler := AioEventHandler new.
	OSProcess deleteFileNamed: fileName.
	[anOpenFile := FileStream fileNamed: fileName.
	fileHandle := eventHandler handleForFile: anOpenFile.
	sema := Semaphore new.
	semaIndex := Smalltalk registerExternalObject: sema.
	[aioEnableResult := eventHandler
			aioEnable: fileHandle
			forSemaphore: semaIndex
			externalObject: true]
		on: Warning
		do: ["Suppress warning dialog. Unit test will fail next assert."].
	self assert: semaIndex == aioEnableResult.

	aioHandleResult := eventHandler
		aioHandle: fileHandle
		exceptionEvents: false
		readEvents: false
		writeEvents: true.
	self assert: aioHandleResult == 2r0100.
	(Delay forMilliseconds: 20) wait. "Allow signals to be handled"
	self assert: sema isSignaled. "File is empty but writable. A signal is sent once,
	presumably in the interest of priming the pump. A listening process would
	begin writing data based on having received this initial signal."
	sema wait. "consume the signal"
	self deny: sema isSignaled.

	"Reset handler"
	aioHandleResult := eventHandler
		aioHandle: fileHandle
		exceptionEvents: false
		readEvents: false
		writeEvents: true.
	(Delay forMilliseconds: 20) wait. "Allow signals to be handled"
	self assert: sema isSignaled. "File is empty but writable. A signal is sent once,
	presumably in the interest of priming the pump. A listening process would
	begin writing data based on having received this initial signal."
	sema wait. "consume the signal"
	self deny: sema isSignaled.

	"Reset handler"
	aioHandleResult := eventHandler
		aioHandle: fileHandle
		exceptionEvents: false
		readEvents: false
		writeEvents: true.
	anOpenFile upToEnd.
	(Delay forMilliseconds: 20) wait. "Allow signals to be handled"
	self assert: sema isSignaled. "File is empty but writable. A signal is sent once,
	presumably in the interest of priming the pump. A listening process would
	begin writing data based on having received this initial signal."
	sema wait. "consume the signal"
	self deny: sema isSignaled.

	"Reset handler"
	aioHandleResult := eventHandler
		aioHandle: fileHandle
		exceptionEvents: false
		readEvents: false
		writeEvents: true.
	anOpenFile nextPutAll: 'write some stuff to the file'; flush.
	(Delay forMilliseconds: 20) wait. "Allow signals to be handled"
	self assert: sema isSignaled. "File is empty but writable. A signal is sent once,
	presumably in the interest of priming the pump. A listening process would
	begin writing data based on having received this initial signal."
	sema wait. "consume the signal"
	self deny: sema isSignaled.

	(Delay forMilliseconds: 20) wait. "Allow signals to be handled"
	self deny: sema isSignaled. "handler has not been reset"]
		ensure:
			[[anOpenFile close] on: Error do: [].
			Smalltalk unregisterExternalObject: sema.
			(fileHandle isKindOf: Integer) ifTrue: [eventHandler aioDisable: fileHandle]]