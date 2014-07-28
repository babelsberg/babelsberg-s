primitive access
primAioSuspend: aDescriptor exceptionEvents: exceptionFlag readEvents: readFlag writeEvents: writeFlag
	"Temporarily suspend asynchronous event notification for a descriptor. The
	descriptor parameter is an object representing a low level OS file or socket
	descriptor. The remaining three parameters are Boolean flags representing the
	types of events for which notification is being requested: handle exceptions,
	handle for read, and handle for write."

	<primitive: 'primitiveAioSuspend' module: 'AioPlugin'>
	^ nil
