display handling - old plugin compatibility
oldPrimGetXDisplayName

	"Deprecated - install the XDisplayControlPlugin to eliminate the need to call this method"

	"Answer a string containing the name for the X display, or nil if the display was opened
	using the $DISPLAY environment variable. This answers the name of the X display as of
	the time it was last opened, which may be different from the current setting of $DISPLAY."

	"OSProcess accessor primGetXDisplayName"

	<primitive: 'primitiveGetXDisplayName' module: 'UnixOSProcessPlugin'>
	^ nil

