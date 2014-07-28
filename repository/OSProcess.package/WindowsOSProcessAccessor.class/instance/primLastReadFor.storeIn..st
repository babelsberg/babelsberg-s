private - primitive access
primLastReadFor: aSemaphoreIndex storeIn: aThreeElementArray
	"A character has been read into an external buffer corresponding to aSemaphoreIndex,
	and is now available. Answer integer value of the character, or nil if no character
	was read, or -1 if an error occurred on the read. Contents of the aThreeElementArray
	will be status of the read call, character read, and character count (which should
	always be 1)."

	<primitive: 'primitiveLastReadForStoreIn' module: 'Win32OSProcessPlugin'>
	^ nil