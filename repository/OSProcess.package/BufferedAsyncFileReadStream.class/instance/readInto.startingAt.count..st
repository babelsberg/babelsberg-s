read, write, position
readInto: byteArray startingAt: startIndex count: count 
	"Read into the given array as specified, and return the count actually
	transferred. "

	| s size |
	self isBlocking
		ifTrue: [self waitForDataReady: count.
			s := self readSyncSemaphore
						critical: [self readBuffer next: count].
			size := count]
		ifFalse: [size := self readBuffer size - readBuffer position min: count.
			s := self readSyncSemaphore
						critical: [self readBuffer next: size]].
	byteArray
		replaceFrom: startIndex
		to: startIndex + size - 1
		with: s.
	^ size