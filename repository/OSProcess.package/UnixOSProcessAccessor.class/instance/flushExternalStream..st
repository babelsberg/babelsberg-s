file control
flushExternalStream: anIOHandle
	"Convert anIOHandle to an SQFile data structure and call primitive to flush the
	external I/O stream."

	^ self primSQFileFlush: (self handleFromAccessor: anIOHandle)
