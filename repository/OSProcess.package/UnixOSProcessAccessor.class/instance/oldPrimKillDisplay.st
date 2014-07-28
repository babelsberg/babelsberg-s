display handling - old plugin compatibility
oldPrimKillDisplay

	"Deprecated - install the XDisplayControlPlugin to eliminate the need to call this method"

	"Call an internal function which will disconnect the X display session."

	"OSProcess thisOSProcess processAccessor primKillDisplay"

	<primitive: 'primitiveKillDisplay' module: 'UnixOSProcessPlugin'>
	^ nil

