read ahead buffer
appendAllToBuffer: chars
	"Append all chars to readBuffer, then signal dataAvailableSemaphore to inform
	any blocked reader that the read can proceed. Also generate a #changed event
	to inform any interested objects that new data has become available."

	| pos |
	self readSyncSemaphore critical:
		[(self readBuffer position > self maxReadBufferSize) ifTrue:
			["Read buffer is getting too large. Replace it."
			self readBuffer: (ReadWriteStream on: readBuffer upToEnd)].
		pos := readBuffer position.
		readBuffer setToEnd.
		readBuffer nextPutAll: chars.
		readBuffer position: pos].
	self dataAvailableSemaphore signal.
	self changed