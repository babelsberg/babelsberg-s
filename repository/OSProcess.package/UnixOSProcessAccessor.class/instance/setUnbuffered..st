file control
setUnbuffered: anIOHandle
	"Convert anIOHandle to an SQFile data structure and call primitive to set unbuffered I/O."

	^ self primSQFileSetUnbuffered: (self handleFromAccessor: anIOHandle)