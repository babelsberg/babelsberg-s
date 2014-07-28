display handling - old plugin compatibility
oldPrimOpenXDisplay

	"Deprecated - install the XDisplayControlPlugin to eliminate the need to call this method"

	"Call an internal function which will open the X display session."

	"OSProcess thisOSProcess processAccessor primKillDisplay.
	(Delay forSeconds: 5) wait.
	OSProcess thisOSProcess processAccessor primOpenXDisplay"

	<primitive: 'primitiveOpenXDisplay' module: 'UnixOSProcessPlugin'>
	^ nil

