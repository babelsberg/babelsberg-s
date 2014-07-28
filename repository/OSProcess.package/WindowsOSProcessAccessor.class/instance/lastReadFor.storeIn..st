nonblocking read
lastReadFor: aSemaphoreIndex storeIn: aThreeElementArray
	"A character has been read into an external buffer corresponding to aSemaphoreIndex,
	and is now available. Answer integer value of the character, or nil if no character
	was read, or -1 if an error occurred on the read. The results of the read call are
	stored in aThreeElementArray as a side effect."

	^ self primLastReadFor: aSemaphoreIndex storeIn: aThreeElementArray
