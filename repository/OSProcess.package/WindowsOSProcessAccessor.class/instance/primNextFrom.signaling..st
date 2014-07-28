private - primitive access
primNextFrom: anIOHandle signaling: aSemaphoreIndex
	"Read the next character from anIOHandle (a SQFile struct) into a buffer in the VM. When
	the read completes, signal the specified Semaphore to notify that the character is available."

	<primitive: 'primitiveNextFromSignaling' module: 'Win32OSProcessPlugin'>

	^ nil

