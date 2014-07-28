primitive access
primAioDisable: aDescriptor
	"Definitively disable asynchronous event notification for a descriptor. The descriptor
	parameter is an object representing a low level OS file or socket descriptor."

	<primitive: 'primitiveAioDisable' module: 'AioPlugin'>
	^ nil
