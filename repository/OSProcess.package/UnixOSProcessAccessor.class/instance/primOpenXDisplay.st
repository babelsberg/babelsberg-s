display handling
primOpenXDisplay
	"Call an internal function which will open the X display session."

	"OSProcess thisOSProcess processAccessor primKillDisplay.
	(Delay forSeconds: 5) wait.
	OSProcess thisOSProcess processAccessor primOpenXDisplay"

	<primitive: 'primitiveOpenDisplay' module: 'XDisplayControlPlugin'>
	^ self oldPrimOpenXDisplay

