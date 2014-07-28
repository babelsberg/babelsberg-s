file control
setBlocking: anIOHandle
	"Convert anIOHandle to an SQFile data structure and call primitive to set for blocking I/O."

	"FIXME: need to implement this for Win32"
	"self notify: 'there is no general mechanism to set blocking IO on Win32'"
