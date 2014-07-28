display handling
primSetXDisplayName: aStringOrNil
	"Set the name for the X display for use in the next call to primitiveOpenXDisplay.
	aStringOrNil must be either a String (such as 'myhost:0') or nil, indicating that
	the current value of $DISPLAY should be used."

	"OSProcess accessor primSetXDisplayName: ':0.0' "
	"OSProcess accessor primSetXDisplayName: nil "

	<primitive: 'primitiveSetDisplayName' module: 'XDisplayControlPlugin'>
	^ self oldPrimSetXDisplayName: aStringOrNil

