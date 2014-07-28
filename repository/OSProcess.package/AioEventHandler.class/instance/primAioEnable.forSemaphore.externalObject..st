primitive access
primAioEnable: aDescriptor forSemaphore: semaphoreIndex externalObject: trueOrFalse
	"Enable asynchronous notification for a descriptor. The descriptor parameter is an
	object representing a low level OS file or socket descriptor. The semaphoreIndex
	is the index of a Semaphore to be notified, and the third parameter is a flag indicating
	that descriptor represents an external object which should not be closed on termination
	of aio handling."

	<primitive: 'primitiveAioEnable' module: 'AioPlugin'>
	^ nil
