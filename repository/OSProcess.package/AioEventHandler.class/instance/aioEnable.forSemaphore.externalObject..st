aio event forwarding
aioEnable: ioDescriptor forSemaphore: semaphoreIndex externalObject: trueOrFalse
	"Enable asynchronous notification for a descriptor. Send this message one time
	prior to beginning event handling for ioDescriptor. The ioDescriptor parameter is an
	object representing a low level OS file or socket descriptor. The semaphoreIndex is
	the index of a Semaphore to be notified, and the third parameter is a flag indicating
	that ioDescriptor represents an external object which should not be closed on termination
	of aio handling."

	^ (self primAioEnable: ioDescriptor forSemaphore: semaphoreIndex externalObject: trueOrFalse)
			ifNil: [self notify: 'aio event forwarding not supported']
