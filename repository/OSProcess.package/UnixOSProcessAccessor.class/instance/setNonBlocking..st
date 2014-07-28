file control
setNonBlocking: anIOHandle
	"Convert anIOHandle to an SQFile data structure and call primitive to set it non-blocking."

	^ self primSQFileSetNonBlocking: (self handleFromAccessor: anIOHandle)