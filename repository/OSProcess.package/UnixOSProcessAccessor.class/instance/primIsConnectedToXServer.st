display handling
primIsConnectedToXServer
	"Answer true if VM is currently connected to an X server."

	"OSProcess accessor primIsConnectedToXServer inspect"
	"| x |
	OSProcess accessor primKillDisplay.
	x := OSProcess accessor primIsConnectedToXServer.
	OSProcess accessor primOpenXDisplay.
	x inspect"

	<primitive: 'primitiveIsConnectedToDisplay' module: 'XDisplayControlPlugin'>
	^ self oldPrimIsConnectedToXServer

