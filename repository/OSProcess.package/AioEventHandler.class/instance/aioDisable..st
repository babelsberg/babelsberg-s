aio event forwarding
aioDisable: ioDescriptor
	"Definitively disable asynchronous event notification for a descriptor. The ioDescriptor
	parameter is an object representing a low level OS file or socket descriptor."

	^ self primAioDisable: ioDescriptor
