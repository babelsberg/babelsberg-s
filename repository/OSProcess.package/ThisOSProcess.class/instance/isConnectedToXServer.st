display management
isConnectedToXServer
	"Answer true if VM is currently connected to an X server."

	"self thisOSProcess isConnectedToXServer"

	^ self processAccessor primIsConnectedToXServer

