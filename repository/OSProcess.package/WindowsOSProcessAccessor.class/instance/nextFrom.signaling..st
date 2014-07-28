nonblocking read
nextFrom: aFileStream signaling: aSemaphoreIndex
	"Read the next character from aFileStream into a buffer in the VM. When the read completes,
	signal the specified Semaphore to notify that the character is available."

	| sqFile |
	sqFile := UseIOHandle
				ifTrue: [aFileStream ioHandle handle]
				ifFalse: [aFileStream fileID].
	^ self primNextFrom: sqFile signaling: aSemaphoreIndex
