system locking
test
	"Answer true if this is a lockable file or region"

	| handle result |
	handle := ThisOSProcess accessor handleFromFileStream: self fileStream.
	result := ThisOSProcess accessor
		primTestLockableFileRegion: handle
		offset: self offset
		length: self length
		exclusive: self isExclusive.
		
	^ (result == -1 or: [result isNil])
		ifTrue: [false]
		ifFalse: [result first]