private - primitive access
primLastReadFor: aSemaphoreIndex
	"A character has been read into an external buffer corresponding to aSemaphoreIndex,
	and is now available. Answer integer value of the character, or nil if no character
	was read, or -1 if an error occurred on the read."

	<primitive: 'primitiveLastReadFor' module: 'Win32OSProcessPlugin'>
	^ nil