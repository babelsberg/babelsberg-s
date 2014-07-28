system locking
unlockIfFail: failBlock

	| handle result |
	handle := ThisOSProcess accessor handleFromFileStream: self fileStream.
	result := ThisOSProcess accessor
		primUnlockFileRegion: handle
		offset: self offset
		length: self length.
	result == 0
		ifTrue: [^ true]
		ifFalse: [^ failBlock value]
