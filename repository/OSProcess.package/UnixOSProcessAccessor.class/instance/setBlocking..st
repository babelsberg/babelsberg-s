file control
setBlocking: anIOHandle
	"Convert anIOHandle to an SQFile data structure and call primitive to set for blocking I/O."

	^ self primSQFileSetBlocking: (self handleFromAccessor: anIOHandle)
