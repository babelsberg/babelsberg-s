display handling
primGetXDisplayName
	"Answer a string containing the name for the X display, or nil if the display was opened
	using the $DISPLAY environment variable. This answers the name of the X display as of
	the time it was last opened, which may be different from the current setting of $DISPLAY."

	"OSProcess accessor primGetXDisplayName"

	<primitive: 'primitiveGetDisplayName' module: 'XDisplayControlPlugin'>
	^ self oldPrimGetXDisplayName

