read ahead buffer
appendToBuffer: aCharacter
	"Append aCharacter to readBuffer, then signal dataAvailableSemaphore to inform
	any blocked reader that the read can proceed, and trigger a #dataReady event to
	inform any interested objects that new data has become available."

	| pos |
	self readSyncSemaphore critical:
		[pos := self readBuffer position.
		readBuffer setToEnd.
		readBuffer nextPut: aCharacter.
		readBuffer position: pos].
	self dataAvailableSemaphore signal.
	self changed