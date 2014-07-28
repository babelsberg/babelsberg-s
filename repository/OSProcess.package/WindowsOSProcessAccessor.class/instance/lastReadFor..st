nonblocking read
lastReadFor: aSemaphoreIndex
	"A character has been read into an external buffer corresponding to aSemaphoreIndex,
	and is now available. Answer integer value of the character, or nil if no character
	was read, or -1 if an error occurred on the read."

	| c readResult |
	readResult := Array new: 3.
	c := self primLastReadFor: aSemaphoreIndex storeIn: readResult.
	(c < 1) ifTrue: [self error: 'primLastReadFor: error, returned negative value'].
	^ c
