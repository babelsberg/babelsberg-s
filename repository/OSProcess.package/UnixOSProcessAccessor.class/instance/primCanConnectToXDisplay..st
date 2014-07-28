display handling
primCanConnectToXDisplay: xDisplayName
	"Open and close a connection to displayName. It the connection was successfully
	opened, answer true; otherwise false. This is intended to check for the ability
	to open an X display prior to actually making the attempt."

	"OSProcess accessor primCanConnectToXDisplay: ':0.0' "
	"OSProcess accessor primCanConnectToXDisplay: ':1' "

	<primitive: 'primitiveCanConnectToDisplay' module: 'XDisplayControlPlugin'>
	^ self oldPrimCanConnectToXDisplay: xDisplayName

