display handling - old plugin compatibility
oldPrimCanConnectToXDisplay: xDisplayName

	"Deprecated - install the XDisplayControlPlugin to eliminate the need to call this method"

	"Open and close a connection to displayName. It the connection was successfully
	opened, answer true; otherwise false. This is intended to check for the ability
	to open an X display prior to actually making the attempt."

	"OSProcess accessor primCanConnectToXDisplay: ':0.0' "
	"OSProcess accessor primCanConnectToXDisplay: ':1' "

	<primitive: 'primitiveCanConnectToXDisplay' module: 'UnixOSProcessPlugin'>
	^ nil

