primitive access
primAioHandle: aDescriptor exceptionEvents: exceptionFlag readEvents: readFlag writeEvents: writeFlag
	"Enable asynchronous notification for a descriptor. The descriptor parameter is an
	object representing a low level OS file or socket descriptor. The second parameter is
	the index of a Semaphore to be notified, the remaining three parameters are Boolean
	flags representing the types of events for which notification is being requested:
	handle exceptions, handle for read, and handle for write. It is common to watch for
	read events and exception events, or to watch for write events and exception events."

	<primitive: 'primitiveAioHandle' module: 'AioPlugin'>
	^ nil
