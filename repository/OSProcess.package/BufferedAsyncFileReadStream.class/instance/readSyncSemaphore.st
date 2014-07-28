accessing
readSyncSemaphore
	"A semaphore for synchronizing access to readBuffer"

	^ readSyncSemaphore ifNil: [readSyncSemaphore := Semaphore forMutualExclusion]