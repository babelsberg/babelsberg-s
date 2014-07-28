system locking
lockIfFail: failBlock

	| handle result |
	handle := ThisOSProcess accessor handleFromFileStream: self fileStream.
	result := ThisOSProcess accessor
		primLockFileRegion: handle
		offset: self offset
		length: self length
		exclusive: self isExclusive.
	result == 0
		ifTrue: [^ true]
		ifFalse: [^ failBlock value]
