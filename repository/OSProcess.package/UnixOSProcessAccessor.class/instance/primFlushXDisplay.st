display handling
primFlushXDisplay
	"Call an internal function to synchronize output to the X display."

	"OSProcess thisOSProcess processAccessor primFlushXDisplay"

	<primitive: 'primitiveFlushDisplay' module: 'XDisplayControlPlugin'>
	^ nil

