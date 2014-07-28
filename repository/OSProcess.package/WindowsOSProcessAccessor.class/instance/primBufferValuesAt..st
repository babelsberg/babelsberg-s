private - primitive access
primBufferValuesAt: aSemaphoreIndex
	"For debugging only. Answer the current values of readCharBufferArray,
	readCharCountArray, and readCharStatusArray at index, an integer corresponding
	to a semaphore for one read handler thread. Answer an Array with the buffered
	character, the character count, and the status value."

	"OSProcess accessor primBufferValuesAt: 1"

	<primitive: 'primitiveBufferValuesAt' module: 'Win32OSProcessPlugin'>
	^ nil