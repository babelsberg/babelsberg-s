testing
testEnableHandleAndDisable

	| eventHandler anOpenFile fileHandle aioHandleResult sema semaIndex aioEnableResult aioDisableResult |
	eventHandler := AioEventHandler new.
	anOpenFile := SourceFiles at: 1.
	fileHandle := eventHandler handleForFile: anOpenFile.
	sema := Semaphore new.
	[semaIndex := Smalltalk registerExternalObject: sema.
	[aioEnableResult := eventHandler
			aioEnable: fileHandle
			forSemaphore: semaIndex
			externalObject: true]
		on: Warning
		do: ["Suppress warning dialog. Unit test will fail next assert."].
	self assert: semaIndex == aioEnableResult.
	aioHandleResult := eventHandler
		aioHandle: fileHandle
		exceptionEvents: true
		readEvents: true
		writeEvents: true.
	self assert: aioHandleResult == 2r0111. "return bitmask, all three bits set"
	aioHandleResult := eventHandler
		aioHandle: fileHandle
		exceptionEvents: true
		readEvents: false
		writeEvents: true.
	self assert: aioHandleResult == 2r0101.
	aioHandleResult := eventHandler
		aioHandle: fileHandle
		exceptionEvents: false
		readEvents: false
		writeEvents: true.
	self assert: aioHandleResult == 2r0100.
	aioHandleResult := eventHandler
		aioHandle: fileHandle
		exceptionEvents: true
		readEvents: false
		writeEvents: false.
	self assert: aioHandleResult == 2r0001.
	aioHandleResult := eventHandler
		aioHandle: fileHandle
		exceptionEvents: false
		readEvents: false
		writeEvents: false.
	self assert: aioHandleResult == 2r0000.
	aioDisableResult := eventHandler aioDisable: fileHandle.
	self assert: aioDisableResult == fileHandle]
		ensure:
			[Smalltalk unregisterExternalObject: sema.
			(fileHandle isKindOf: Integer) ifTrue: [eventHandler aioDisable: fileHandle]]