display handling
primDisconnectDisplay
	"Disconnect the X display session. The actual Squeak window on the X server is not
	effected, but this instance of Squeak will not have any further interaction with it."

	"OSProcess thisOSProcess processAccessor primDisconnectDisplay"

	<primitive: 'primitiveDisconnectDisplay' module: 'XDisplayControlPlugin'>
	^ self oldPrimKillDisplay

