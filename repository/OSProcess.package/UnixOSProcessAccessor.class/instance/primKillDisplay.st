display handling
primKillDisplay
	"Disconnect the X display session and destroy the Squeak window on the X display."

	"OSProcess thisOSProcess processAccessor primKillDisplay"

	<primitive: 'primitiveKillDisplay' module: 'XDisplayControlPlugin'>
	^ self oldPrimKillDisplay

