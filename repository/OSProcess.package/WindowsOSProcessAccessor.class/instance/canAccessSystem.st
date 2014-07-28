testing
canAccessSystem
	"Answer true if it is possible to access the external process, else false. Failure
	to access the external process is probably due to lack of a UnixOSProcessPlugin
	module."

	^ self primGetPid notNil
