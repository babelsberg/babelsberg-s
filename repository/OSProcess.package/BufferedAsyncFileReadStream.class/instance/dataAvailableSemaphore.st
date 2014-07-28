accessing
dataAvailableSemaphore
	"Signalled one or more times when data becomes available. Only one Process
	is permitted to wait on this Semaphore."

	^ dataAvailableSemaphore ifNil: [dataAvailableSemaphore := Semaphore new]
