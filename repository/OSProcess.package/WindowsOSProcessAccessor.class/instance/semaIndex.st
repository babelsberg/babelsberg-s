accessing
semaIndex
	"Index of the registered Semaphore"

	semaIndex ifNil: [self initialize].
	^ semaIndex