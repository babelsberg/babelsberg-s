aio event forwarding
aioHandle: ioDescriptor exceptionEvents: exceptionFlag readEvents: readFlag writeEvents: writeFlag
	"Enable asynchronous notification for a descriptor. Send this message one time to
	enable a single event notification. Send it again after each event has been received
	and handled (in other words, the process which waits on the event semaphore is
	responsible for re-enabling the handler by calling this method each time an event
	is handled). The ioDescriptor parameter is an object representing a low level OS file or
	socket descriptor. The remaining three parameters are Boolean flags representing the
	types of events for which notification is being requested: handle exceptions, handle
	for read, and handle for write. It is common to watch for read events and exception
	events, or to watch for write events and exception events."

	^ self primAioHandle: ioDescriptor
		exceptionEvents: exceptionFlag
		readEvents: readFlag
		writeEvents: writeFlag
