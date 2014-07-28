file control
setNonBlocking: anIOHandle
	"Convert anIOHandle to an SQFile data structure and call primitive to set it non-blocking."

	"FIXME: need to implement this for Win32"
	"self notify: 'there is no general mechanism to set nonblocking IO on Win32'"

