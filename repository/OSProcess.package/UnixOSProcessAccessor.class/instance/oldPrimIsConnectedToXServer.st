display handling - old plugin compatibility
oldPrimIsConnectedToXServer

	"Deprecated - install the XDisplayControlPlugin to eliminate the need to call this method"

	"Answer true if VM is currently connected to an X server."

	"OSProcess accessor primIsConnectedToXServer inspect"
	"| x |
	OSProcess accessor primKillDisplay.
	x := OSProcess accessor primIsConnectedToXServer.
	OSProcess accessor primOpenXDisplay.
	x inspect"

	<primitive: 'primitiveIsConnectedToXServer' module: 'UnixOSProcessPlugin'>
	^ nil

