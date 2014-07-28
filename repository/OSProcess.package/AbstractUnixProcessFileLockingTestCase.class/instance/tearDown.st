running
tearDown

	| d |
	OSProcessAccessor emulateWin32FileLocking: self initialCompatibilitySetting.
	d := Delay forMilliseconds: 50.
	self fileStream close.
	remoteProcess ifNotNil:
		[remoteProcess terminate.
		[remoteProcess isComplete] whileFalse: [d wait].
		remoteProcess := nil]
