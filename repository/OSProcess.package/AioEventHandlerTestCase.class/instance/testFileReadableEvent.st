testing
testFileReadableEvent

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
		readEvents: true
		writeEvents: false.
	self assert: aioHandleResult == 2r010.
	(Delay forMilliseconds: 20) wait. "Allow signals to be handled"
	self assert: sema isSignaled. "File is empty but readable. A signal is sent once,
	presumably in the interest of priming the pump. A listening process would
	begin reading data based on having received this initial signal."
	sema wait. "consume the signal"
	(Delay forMilliseconds: 20) wait. "Allow signals to be handled"
	self deny: sema isSignaled. "Nothing has happened to indicate more data available."

	aioHandleResult := eventHandler
		aioHandle: fileHandle
		exceptionEvents: false
		readEvents: true
		writeEvents: false.
	self assert: aioHandleResult == 2r010.
	(Delay forMilliseconds: 20) wait. "Allow signals to be handled"
	self assert: sema isSignaled. "File is empty but readable. A signal is sent once,
	presumably in the interest of priming the pump. A listening process would
	begin reading data based on having received this initial signal."
	sema wait. "consume the signal"
	(Delay forMilliseconds: 20) wait. "Allow signals to be handled"
	self deny: sema isSignaled. "Nothing has happened to indicate more data available."

	aioHandleResult := eventHandler
		aioHandle: fileHandle
		exceptionEvents: false
		readEvents: true
		writeEvents: false.
	self assert: aioHandleResult == 2r010.
	anOpenFile nextPutAll: 'write some stuff to the file'; flush.
	(Delay forMilliseconds: 20) wait. "Allow signals to be handled"
	self assert: sema isSignaled. "File is empty but readable. A signal is sent once,
	presumably in the interest of priming the pump. A listening process would
	begin reading data based on having received this initial signal."
	sema wait. "consume the signal"

	aioHandleResult := eventHandler
		aioHandle: fileHandle
		exceptionEvents: false
		readEvents: true
		writeEvents: false.
	self assert: aioHandleResult == 2r010.
	anOpenFile upToEnd.
	(Delay forMilliseconds: 20) wait. "Allow signals to be handled"
	self assert: sema isSignaled. "File is empty but readable. A signal is sent once,
	presumably in the interest of priming the pump. A listening process would
	begin reading data based on having received this initial signal."
	sema wait. "consume the signal"

	(Delay forMilliseconds: 20) wait. "Allow signals to be handled"
	self deny: sema isSignaled. "handler has not been reset"]
		ensure:
			[[anOpenFile close] on: Error do: [].
			Smalltalk unregisterExternalObject: sema.
			(fileHandle isKindOf: Integer) ifTrue: [eventHandler aioDisable: fileHandle]]